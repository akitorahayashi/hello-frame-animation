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

# --- Find Simulator ---
step "Finding suitable iOS Simulator"

SIMULATOR_NAME_PATTERN="iPhone"
echo "Searching for valid '$SIMULATOR_NAME_PATTERN' simulator..."
SIMCTL_OUTPUT=$(xcrun simctl list devices available --json)
if [ $? -ne 0 ]; then
    fail "xcrun simctl からシミュレーターリストの取得に失敗しました。"
fi
if [ -z "$SIMCTL_OUTPUT" ]; then
    fail "xcrun simctl が空の出力を返しました。"
fi

echo "simctl 出力を解析中..."
SIMULATOR_ID=$(echo "$SIMCTL_OUTPUT" | jq -r --arg pattern "$SIMULATOR_NAME_PATTERN" \
  '.devices | to_entries[] | select(.key | startswith("com.apple.CoreSimulator.SimRuntime.iOS")) | .value[] | select(.isAvailable == true and (.name | contains($pattern))) | .udid' | head -n 1)

if [ -z "$SIMULATOR_ID" ]; then
    echo "エラー: パターン '$SIMULATOR_NAME_PATTERN' に一致する利用可能なシミュレーターが見つかりませんでした。" >&2
    echo "Full simctl output:\n$SIMCTL_OUTPUT" >&2
    fail "Failed to find a suitable simulator."
fi

SIMULATOR_NAME=$(echo "$SIMCTL_OUTPUT" | jq -r --arg udid "$SIMULATOR_ID" '.devices | .[] | .[] | select(.udid == $udid) | .name' | head -n 1 || echo "名前取得不可")

echo "Found simulator: $SIMULATOR_NAME (ID: $SIMULATOR_ID)"

SIMULATOR_DESTINATION="id=$SIMULATOR_ID"

echo "Using Simulator Destination: $SIMULATOR_DESTINATION"
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
| xcbeautify || fail "UI tests failed."

# UI テスト結果バンドルの存在を確認
echo "Verifying UI test results bundle..."
if [ ! -d "$TEST_RESULTS_DIR/ui/TestResults.xcresult" ]; then
  fail "UI test result bundle not found at $TEST_RESULTS_DIR/ui/TestResults.xcresult"
fi
success "UI test result bundle found at $TEST_RESULTS_DIR/ui/TestResults.xcresult"


step "Local UI Test Check Completed Successfully!"

set +x # スクリプト冒頭で set -x をコメント解除した場合、こちらもコメント解除