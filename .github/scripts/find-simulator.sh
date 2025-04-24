#!/bin/bash

# コマンドが失敗したらすぐに終了する
set -e

# 利用可能な最初の iOS シミュレータを検索
echo "利用可能な最初の iOS シミュレータを検索中... (xcrun simctl)" >&2

# xcrun simctl から利用可能なデバイスリストを JSON 形式で取得
SIMCTL_OUTPUT=$(xcrun simctl list devices available --json)
if [ $? -ne 0 ] || [ -z "$SIMCTL_OUTPUT" ]; then
    echo "エラー: xcrun simctl からシミュレータリストの取得に失敗しました。" >&2
    exit 1
fi

# jq がインストールされているか確認 (簡易チェック)
if ! command -v jq &> /dev/null; then
    echo "エラー: jq コマンドが見つかりません。jq をインストールしてください (例: brew install jq)。" >&2
    exit 1
fi

# jq クエリ: iOS, 利用可能 -> UDID を取得
# 可能な限り最新の iOS バージョンのシミュレータを優先するようにソートを追加 (バージョン文字列で逆順ソート)
# Runtime キー (例: com.apple.CoreSimulator.SimRuntime.iOS-18-3) でソート
JQ_QUERY='''.devices | to_entries | map(select(.key | startswith("com.apple.CoreSimulator.SimRuntime.iOS"))) | sort_by(.key) | reverse | .[].value[] | select(.isAvailable == true) | .udid'

# 利用可能な最初の UDID を取得
SIMULATOR_UDID=$(echo "$SIMCTL_OUTPUT" | jq -r "$JQ_QUERY" | head -n 1)

if [ -z "$SIMULATOR_UDID" ]; then
    echo "エラー: 利用可能な iOS シミュレータが見つかりませんでした。" >&2
    echo "--- simctl 出力抜粋 (iOS Simulators) --- " >&2
    echo "$SIMCTL_OUTPUT" | jq '.devices | to_entries[] | select(.key | startswith("com.apple.CoreSimulator.SimRuntime.iOS"))' || echo "(jq での抽出失敗)" >&2
    echo "-------------------------------------" >&2
    exit 1
fi

# 見つかったシミュレータの名前をログ出力用に取得 (失敗しても続行)
SIMULATOR_NAME=$(echo "$SIMCTL_OUTPUT" | jq -r --arg udid "$SIMULATOR_UDID" '.devices | .[] | .[] | select(.udid == $udid) | .name' | head -n 1 || echo "(名前取得失敗)")
echo "シミュレータが見つかりました: $SIMULATOR_NAME (UDID: $SIMULATOR_UDID)" >&2

# UDID を標準出力へ
echo "$SIMULATOR_UDID"