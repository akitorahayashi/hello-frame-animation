#!/bin/bash

# コマンドが失敗したらすぐに終了
set -e

PROJECT_NAME="HelloFrameAnimation.xcodeproj"
APP_SCHEME="HelloFrameAnimation"
UI_TEST_SCHEME="HelloFrameAnimationUITests"
SIMULATOR_NAME_PATTERN="iPhone"

echo "Searching for valid '$SIMULATOR_NAME_PATTERN' simulator destination for scheme '$APP_SCHEME'..." >&2

SIMCTL_OUTPUT=$(xcrun simctl list devices available --json)
if [ $? -ne 0 ]; then
    echo "エラー: xcrun simctl からシミュレーターリストの取得に失敗しました。" >&2
    exit 1
fi
if [ -z "$SIMCTL_OUTPUT" ]; then
    echo "エラー: xcrun simctl が空の出力を返しました。" >&2
    exit 1
fi

echo "simctl 出力を解析中..." >&2

SIMULATOR_UDID=$(echo "$SIMCTL_OUTPUT" | jq -r --arg pattern "$SIMULATOR_NAME_PATTERN" \
  '.devices | to_entries[] | select(.key | startswith("com.apple.CoreSimulator.SimRuntime.iOS")) | .value[] | select(.isAvailable == true and (.name | contains($pattern))) | .udid' | head -n 1)

if [ -z "$SIMULATOR_UDID" ]; then
    echo "エラー: パターン '$SIMULATOR_NAME_PATTERN' に一致する利用可能なシミュレーターが見つかりませんでした。" >&2
    # デバッグ用に完全な出力をログに記録する
    echo "Full simctl output:\n$SIMCTL_OUTPUT" >&2
    exit 1
fi

SIMULATOR_NAME=$(echo "$SIMCTL_OUTPUT" | jq -r --arg udid "$SIMULATOR_UDID" '.devices | .[] | .[] | select(.udid == $udid) | .name' | head -n 1 || echo "名前取得不可")

echo "Found simulator: $SIMULATOR_NAME (ID: $SIMULATOR_UDID)" >&2

# すべてのチェックをパスしたらIDを出力 (stdout)
echo "Using simulator: $SIMULATOR_NAME (ID: $SIMULATOR_UDID)" >&2
echo "$SIMULATOR_UDID"