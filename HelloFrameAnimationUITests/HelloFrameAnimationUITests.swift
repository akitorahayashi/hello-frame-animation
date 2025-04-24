import XCTest

final class HelloFrameAnimationUITests: XCTestCase {
    var app: XCUIApplication?

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        
        app = XCUIApplication()
        app?.launch()

        // 左横向きに回転
        XCUIDevice.shared.orientation = .landscapeRight
    }

    override func tearDown() {
        app?.terminate()
        app = nil
        super.tearDown()
    }

    @MainActor
    func testHelloAnimationScreenshots() throws {

        // 保存先ディレクトリのパスを設定
        let screenshotsDirectory = URL(fileURLWithPath: #file)
            .deletingLastPathComponent() // HelloFrameAnimationUITests.swift
            .appendingPathComponent("ScreenShots")

        // ディレクトリが存在しない場合は作成
        try? FileManager.default.createDirectory(at: screenshotsDirectory, withIntermediateDirectories: true, attributes: nil)

        // 最初のアニメーションが中間点に達するまで待機
        sleep(UInt32(AnimationConstants.duration + 0.5))

        // 最初のスクリーンショットを撮影
        let screenshot1 = XCUIScreen.main.screenshot()
        let attachment1 = XCTAttachment(screenshot: screenshot1)
        attachment1.name = "Midpoint_Initial_LandscapeLeft"
        attachment1.lifetime = .keepAlways
        add(attachment1)

        // スクリーンショットをファイルに保存
        saveScreenshotAndAttachment(named: attachment1.name ?? "screenshot1", screenshot: screenshot1, in: screenshotsDirectory)

        sleep(UInt32(AnimationConstants.duration + AnimationConstants.animationDelay))

        // 画面をタップしてアニメーションを再開
        app?.windows.firstMatch.tap()

        // 再開されたアニメーションが中間点に達するまで待機
        sleep(UInt32(AnimationConstants.duration))

        // 2番目のスクリーンショットを撮影
        let screenshot2 = XCUIScreen.main.screenshot()
        let attachment2 = XCTAttachment(screenshot: screenshot2)
        attachment2.name = "Midpoint_Restarted_LandscapeLeft"
        attachment2.lifetime = .keepAlways
        add(attachment2)

        // スクリーンショットをファイルに保存
        saveScreenshotAndAttachment(named: attachment2.name ?? "screenshot2", screenshot: screenshot2, in: screenshotsDirectory)
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
