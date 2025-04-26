import XCTest

final class HelloFrameAnimationUITests: XCTestCase {
    
    var app: XCUIApplication!

    enum AnimationPhase: String {
        case going = "Going"
        case returning = "Return"
        case restarting = "Restart"
        func directory(baseURL: URL) -> URL {
            baseURL.appendingPathComponent(self.rawValue)
        }
    }

    struct CaptureStep {
        let step: Int
        let namePart: String
        let isStart: Bool

        static let sequence: [CaptureStep] = [
            CaptureStep(step: 0, namePart: "Start", isStart: true),
            CaptureStep(step: 1, namePart: "Quarter", isStart: false),
            CaptureStep(step: 2, namePart: "Midpoint", isStart: false),
            CaptureStep(step: 3, namePart: "ThreeQuarter", isStart: false),
            CaptureStep(step: 4, namePart: "End", isStart: false),
        ]
    }

    override func setUp() {
        super.setUp()
        continueAfterFailure = false

        app = XCUIApplication()
        app.launch()

        XCUIDevice.shared.orientation = .landscapeRight
    }

    override func tearDown() {
        app.terminate()
        app = nil
        super.tearDown()
    }

    @MainActor
    func testAnimationCycleAndRestart() throws {
        let baseScreenshotsDir = URL(fileURLWithPath: #file)
            .deletingLastPathComponent()
            .appendingPathComponent("ScreenShots")

        // --- ディレクトリ作成 ---
        let phases: [AnimationPhase] = [.going, .returning, .restarting]
        for phase in phases {
            let dir = phase.directory(baseURL: baseScreenshotsDir)
            do {
                try FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true, attributes: nil)
            } catch {
                XCTFail("Failed to create screenshot subdirectory for \(phase): \(error)")
            }
        }

        // スクリーンショットを作成し、保存する
        func captureAndSave(name: String, in directory: URL) {
            let screenshot = XCUIScreen.main.screenshot()
            saveScreenshotAndAttachment(named: name, screenshot: screenshot, in: directory)
        }

        // アニメーション時間を取得 (仮の値、必要に応じて調整)
        // AnimationConstantsが参照できない場合、適切な値を設定してください
        // *** 重要: Going と Return で duration や delay、イージングが異なる場合、***
        // *** 以下の値や executePhase 内の計算が Return フェーズで正しく機能しない可能性があります。***
        // *** アプリ本体のアニメーション実装を確認してください。***
        let duration = AnimationConstants.duration
        let delay = AnimationConstants.animationDelay

        // --- アニメーションフェーズの実行 ---
        func executePhase(_ phase: AnimationPhase) {
            let dir = phase.directory(baseURL: baseScreenshotsDir)
            var lastCaptureTime = CFAbsoluteTimeGetCurrent() // 前回のキャプチャ（またはフェーズ開始）時刻

            // フェーズごとにキャプチャする時間の割合を定義
            let timeFractions: [Double]
            switch phase {
                case .returning: // Return用に割合を調整 (Goingと見た目の進行が違う場合)
                    // 例: 少し早めにキャプチャするように調整
                    timeFractions = [0.0, 0.2, 0.45, 0.7, 1.0]
                    // または例: 少し遅めにキャプチャするように調整
                    // timeFractions = [0.0, 0.3, 0.55, 0.8, 1.0]
                default: // Going, Restarting (およびデフォルト) は均等割
                    timeFractions = [0.0, 0.25, 0.5, 0.75, 1.0]
            }

            guard timeFractions.count == CaptureStep.sequence.count else {
                XCTFail("timeFractions count does not match CaptureStep sequence count.")
                return
            }

            for (index, stepConfig) in CaptureStep.sequence.enumerated() {
                // 各ステップの目標経過時間 (フェーズ開始からの絶対時間)
                let targetAbsoluteTime = lastCaptureTime + (duration * timeFractions[index])

                // 現在時刻と目標時刻までの待機時間を計算
                let currentTime = CFAbsoluteTimeGetCurrent()
                let waitTime = targetAbsoluteTime - currentTime

                // 目標時刻まで待機
                if waitTime > 0.001 { // 1ms以上の待機時間
                    usleep(useconds_t(waitTime * 1_000_000))
                }
                // else { print("waitTime was too short or negative for step \(index): \(waitTime)") } // デバッグ用

                // スクリーンショット名の生成
                var screenshotName: String
                switch (phase, stepConfig.step) {
                    case (.going, 0): screenshotName = "0_Initial"
                    case (.returning, 0): screenshotName = "0_Return_Start"
                    case (.restarting, 0): screenshotName = "0_Restart_Start"
                    default:
                        screenshotName = "\(stepConfig.step)_\(phase.rawValue)_\(stepConfig.namePart)"
                }

                captureAndSave(name: screenshotName, in: dir)
                lastCaptureTime = CFAbsoluteTimeGetCurrent() // 今回のキャプチャ時刻を記録
            }
        }

        // --- テストシーケンス ---
        executePhase(.going)

        sleep(UInt32(delay)) // 休憩

        // Debug: delay直後、Returnフェーズ開始前の状態をキャプチャ
        do {
            let debugDir = baseScreenshotsDir.appendingPathComponent("Debug")
            try FileManager.default.createDirectory(at: debugDir, withIntermediateDirectories: true, attributes: nil)
            captureAndSave(name: "DEBUG_AfterDelay_BeforeReturn", in: debugDir)
        } catch {
            print("Failed to capture debug screenshot: \(error)") // エラー処理を追加
        }

        executePhase(.returning)

        app.windows.firstMatch.tap() // タップ
        executePhase(.restarting)

        // 終了
        sleep(1)
    }

    // スクリーンショット保存の共通ロジック
    private func saveScreenshotAndAttachment(named name: String, screenshot: XCUIScreenshot, in directory: URL) {
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.name = name
        attachment.lifetime = .keepAlways
        add(attachment)

        let fileURL = directory.appendingPathComponent("\(name).png")
        do {
            try screenshot.pngRepresentation.write(to: fileURL)
            print("Screenshot saved to: \(fileURL.path)")
        } catch {
            print("Error saving screenshot \(name): \(error)")
        }
    }
}
