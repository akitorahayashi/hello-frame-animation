import XCTest

final class HelloFrameAnimationUITests: XCTestCase {
    
    var app: XCUIApplication!

    // スクリーンショットのベースディレクトリ
    static let screenshotsBaseDirectory = URL(fileURLWithPath: #file)
        .deletingLastPathComponent()
        .appendingPathComponent("ScreenShots")

    // テスト結果を保存するディレクトリ
    static let testResultsDirectory = screenshotsBaseDirectory

    enum AnimationPhase: String, CaseIterable {
        case going = "Going"
        case returning = "Return"
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

        let fileManager = FileManager.default

        // 各フェーズのディレクトリを準備
        for phase in AnimationPhase.allCases {
            let subDirURL = phase.directory(baseURL: Self.testResultsDirectory)
            // 既存ディレクトリがあれば削除（テスト実行前のクリーンアップ）
            if fileManager.fileExists(atPath: subDirURL.path) {
                do {
                    try fileManager.removeItem(at: subDirURL)
                    print("既存の \(phase.rawValue) ディレクトリを削除しました: \(subDirURL.path)")
                } catch {
                    XCTFail("既存の \(phase.rawValue) ディレクトリの削除に失敗: \(error)")
                }
            }
            // ディレクトリ作成
            do {
                try fileManager.createDirectory(at: subDirURL, withIntermediateDirectories: true, attributes: nil)
            } catch {
                XCTFail("\(phase.rawValue) ディレクトリの作成に失敗: \(error)")
            }
        }
        print("スクリーンショット用ディレクトリ構造を作成しました: \(Self.testResultsDirectory.path)")

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
        var generatedFileNames: [AnimationPhase: [String]] = [:]

        func captureAndSave(name: String, in directory: URL) {
            // アプリのメインウィンドウのスクリーンショットを取得
            let screenshot = app.windows.firstMatch.screenshot()
            saveScreenshotAndAttachment(named: name, screenshot: screenshot, in: directory)
        }

        let duration = AnimationConstants.duration
        let delay = AnimationConstants.animationDelay

        func executePhase(_ phase: AnimationPhase) {
            let targetDirectory = phase.directory(baseURL: Self.testResultsDirectory)

            var currentPhaseFileNames: [String] = []

            let timeFractions: [Double] = [0.0, 0.25, 0.5, 0.75, 1.0]

            guard timeFractions.count == CaptureStep.sequence.count else {
                XCTFail("timeFractions count does not match CaptureStep sequence count.")
                return
            }

            var previousTargetElapsedTime: Double = 0.0

            for (index, stepConfig) in CaptureStep.sequence.enumerated() {
                let targetElapsedTime = duration * timeFractions[index]
                let relativeWaitTime = targetElapsedTime - previousTargetElapsedTime

                if relativeWaitTime > 0.001 {
                    usleep(useconds_t(relativeWaitTime * 1_000_000))
                }

                let screenshotName = "\(stepConfig.step)_\(phase.rawValue)_\(stepConfig.namePart)"
                captureAndSave(name: screenshotName, in: targetDirectory)
                currentPhaseFileNames.append(screenshotName)
                previousTargetElapsedTime = targetElapsedTime
            }

            generatedFileNames[phase] = currentPhaseFileNames
        }

        // アニメーションを開始
        app.windows.firstMatch.tap()

        executePhase(.going)

        sleep(UInt32(delay))

        executePhase(.returning)

        sleep(1)
    }

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
