#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# パターンに一致する利用可能な最初のシミュレータを検索。
SIMULATOR_NAME_PATTERN="iPhone"

echo "'$SIMULATOR_NAME_PATTERN' シミュレータを検索中..." >&2

SIMCTL_OUTPUT=$(xcrun simctl list devices available --json)
if [ $? -ne 0 ] || [ -z "$SIMCTL_OUTPUT" ]; then
    echo "エラー: xcrun simctl からシミュレータリストの取得に失敗しました。" >&2
    exit 1
fi

# jq クエリ: iOS, 利用可能, 名前にパターンを含む -> UDID を取得。
JQ_QUERY='.devices | to_entries[] | select(.key | startswith("com.apple.CoreSimulator.SimRuntime.iOS")) | .value[] | select(.isAvailable == true and (.name | contains($pattern))) | .udid'

# 最初に見つかった UDID を取得。
SIMULATOR_UDID=$(echo "$SIMCTL_OUTPUT" | jq -r --arg pattern "$SIMULATOR_NAME_PATTERN" "$JQ_QUERY" | head -n 1)

if [ -z "$SIMULATOR_UDID" ]; then
    echo "エラー: パターン '$SIMULATOR_NAME_PATTERN' に一致する利用可能なシミュレータが見つかりませんでした。" >&2
    echo "--- 完全な simctl 出力 ---" >&2
    echo "$SIMCTL_OUTPUT" >&2
    echo "-------------------------" >&2
    exit 1
fi

# 見つかったシミュレータをログ出力 (stderr)。
SIMULATOR_NAME=$(echo "$SIMCTL_OUTPUT" | jq -r --arg udid "$SIMULATOR_UDID" '.devices | .[] | .[] | select(.udid == $udid) | .name' | head -n 1 || echo "-")
echo "シミュレータが見つかりました: $SIMULATOR_NAME (ID: $SIMULATOR_UDID)" >&2

# UDID を出力 (stdout)。
echo "$SIMULATOR_UDID" 