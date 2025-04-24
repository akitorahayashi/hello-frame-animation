#!/bin/bash
set -euo pipefail
# set -x # 必要に応じて詳細なコマンドトレースのためにコメントを解除

# === Configuration ===
OUTPUT_DIR="ci-outputs"
TEST_RESULTS_DIR="$OUTPUT_DIR/test-results"
TEST_DERIVED_DATA_DIR="$TEST_RESULTS_DIR/DerivedData"
PROJECT_FILE="HelloFrameAnimation.xcodeproj"
UI_TEST_SCHEME="HelloFrameAnimation"
FIND_SIMULATOR_SCRIPT=".github/scripts/find-simulator.sh"

# === Default Flags ===
skip_build_for_testing=false

# === 引数解析 ===
# --test-without-building フラグのみサポート
while [[ $# -gt 0 ]]; do
  key="$1"
  case $key in
    --test-without-building)
      skip_build_for_testing=true
      shift
      ;;
    *) # 不明なオプション
      echo "Unknown option: $1. Only '--test-without-building' is supported." >&2
      exit 1
      ;;
  esac
done


# === Helper Functions ===
step() {
  echo ""
  echo "──────────────────────────────────────────────────────────────────────"
  echo "▶️  $1"
  echo "──────────────────────────────────────────────────────────────────────"
}

success() {
  echo "✅ $1"
}

fail() {
  echo "❌ Error: $1" >&2 # エラーは標準エラー出力へ
  exit 1
}

check_command() {
  if ! command -v $1 &> /dev/null; then
    echo "⚠️ Warning: '$1' command not found. Attempting to install..." >&2
    if [ "$1" == "xcpretty" ]; then
      gem install xcpretty || fail "Failed to install xcpretty. Please install it manually (gem install xcpretty)."
      success "xcpretty installed successfully."
    # jq のチェックは削除
    else
      fail "Required command '$1' is not installed. Please install it."
    fi
  fi
}

# === Main Script ===

step "Checking prerequisites"
check_command xcpretty
success "Prerequisites met."

if [ "$skip_build_for_testing" = false ]; then
  step "Cleaning previous outputs and creating directories for UI Tests"
  echo "Removing old $OUTPUT_DIR directory if it exists..."
  rm -rf "$OUTPUT_DIR"
  echo "Creating directories..."
  mkdir -p "$TEST_RESULTS_DIR/ui" "$TEST_DERIVED_DATA_DIR"
  success "Directories created under $OUTPUT_DIR."
else
  step "Skipping cleanup and directory creation (reusing existing build outputs for UI Tests)"
  if [ ! -d "$TEST_DERIVED_DATA_DIR" ]; then
      fail "Cannot run tests without building: DerivedData directory not found at $TEST_DERIVED_DATA_DIR. Run the script without '--test-without-building' first."
  fi
  mkdir -p "$TEST_RESULTS_DIR/ui"
  success "Required test directories exist or created."
fi

# --- Find Simulator using external script ---
step "Finding suitable iOS Simulator via $FIND_SIMULATOR_SCRIPT"

# スクリプトが実行可能であることを確認
if [ ! -x "$FIND_SIMULATOR_SCRIPT" ]; then
  echo "Making $FIND_SIMULATOR_SCRIPT executable..."
  chmod +x "$FIND_SIMULATOR_SCRIPT"
  if [ $? -ne 0 ]; then
      fail "Failed to make $FIND_SIMULATOR_SCRIPT executable."
  fi
fi

# スクリプトを実行し、出力をキャプチャ (シミュレータ ID)
SIMULATOR_ID=$("$FIND_SIMULATOR_SCRIPT")
SCRIPT_EXIT_CODE=$?

if [ $SCRIPT_EXIT_CODE -ne 0 ]; then
    fail "$FIND_SIMULATOR_SCRIPT failed with exit code $SCRIPT_EXIT_CODE."
fi

if [ -z "$SIMULATOR_ID" ]; then
    fail "$FIND_SIMULATOR_SCRIPT did not output a simulator ID."
fi

SIMULATOR_DESTINATION="id=$SIMULATOR_ID"

echo "Using Simulator Destination: $SIMULATOR_DESTINATION (obtained from $FIND_SIMULATOR_SCRIPT)"
success "Simulator destination set."

# テスト用にビルド
if [ "$skip_build_for_testing" = false ]; then
  echo "Building for testing"
  set -o pipefail && xcodebuild build-for-testing \
    -project "$PROJECT_FILE" \
    -scheme "$UI_TEST_SCHEME" \
    -destination "platform=iOS Simulator,id=$SIMULATOR_ID" \
    -derivedDataPath "$TEST_DERIVED_DATA_DIR" \
    -configuration Debug \
    -skipMacroValidation \
    CODE_SIGNING_ALLOWED=NO \
  | xcpretty -c || fail "Build for testing failed."
  success "Build for testing completed."
else
    echo "Skipping build for testing as requested (--test-without-building)."
    if [ ! -d "$TEST_DERIVED_DATA_DIR/Build/Intermediates.noindex/XCBuildData" ]; then
       fail "Cannot skip build: No existing build artifacts found in $TEST_DERIVED_DATA_DIR. Run the script without '--test-without-building' first."
    fi
    success "Using existing build artifacts."
fi

# --- UI テスト実行 ---
echo "Running UI tests"
rm -rf "$TEST_RESULTS_DIR/ui/TestResults.xcresult"

set -o pipefail && xcodebuild test-without-building \
  -project "$PROJECT_FILE" \
  -scheme "$UI_TEST_SCHEME" \
  -destination "platform=iOS Simulator,id=$SIMULATOR_ID" \
  -derivedDataPath "$TEST_DERIVED_DATA_DIR" \
  -enableCodeCoverage NO \
  -resultBundlePath "$TEST_RESULTS_DIR/ui/TestResults.xcresult" \
| xcpretty -c || fail "UI tests failed."

# UI テスト結果バンドルの存在を確認
echo "Verifying UI test results bundle..."
if [ ! -d "$TEST_RESULTS_DIR/ui/TestResults.xcresult" ]; then
  fail "UI test result bundle not found at $TEST_RESULTS_DIR/ui/TestResults.xcresult"
fi
success "UI test result bundle found at $TEST_RESULTS_DIR/ui/TestResults.xcresult"


step "Local UI Test Check Completed Successfully!"

set +x # スクリプト冒頭で set -x をコメント解除した場合、こちらもコメント解除