import SwiftUI

struct ContentView: View {
    @State private var drawProgress: CGFloat = AnimationConstants.startTrim
    @State private var isAnimatingForward = true
    @State private var isAnimating = false

    var body: some View {
        GeometryReader { geometry in
            HelloPath()
                .trim(from: AnimationConstants.startTrim, to: drawProgress)
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: DesignConstants.gradientColors),
                        startPoint: .leading,
                        endPoint: .trailing
                    ),
                    style: StrokeStyle(lineWidth: DesignConstants.lineWidth, lineCap: .round, lineJoin: .round)
                )
                .frame(width: geometry.size.width, height: geometry.size.height)
                .contentShape(Rectangle())
                .onAppear {
                    print("\(CFAbsoluteTimeGetCurrent()): onAppear - Calling startAnimation.")
                    startAnimation()
                }
                .onTapGesture {
                    let time = CFAbsoluteTimeGetCurrent()
                    print("\(time): onTapGesture - Tap detected. isAnimating: \(isAnimating)")
                    if !isAnimating {
                        print("\(time): onTapGesture - Calling startAnimation.")
                        startAnimation()
                    }
                }
        }
    }

    // アニメーションを開始する関数
    func startAnimation() {
        let startTime = CFAbsoluteTimeGetCurrent()
        guard !isAnimating else {
            print("\(startTime): startAnimation - Already animating, returning.")
            return
        }

        print("\(startTime): startAnimation - Starting forward animation. Setting isAnimating=true, drawProgress=startTrim.")
        isAnimating = true
        isAnimatingForward = true
        drawProgress = AnimationConstants.startTrim

        withAnimation(.easeInOut(duration: AnimationConstants.duration)) {
            print("\(startTime): startAnimation - Applying forward animation to endTrim.")
            drawProgress = AnimationConstants.endTrim
        } completion: {
            let forwardEndTime = CFAbsoluteTimeGetCurrent()
            guard isAnimatingForward else {
                print("\(forwardEndTime): Forward animation completion called, but no longer animating forward. Ignoring.")
                return
            }
            print("\(forwardEndTime): Forward animation visually completed. Starting delay.")

            DispatchQueue.main.asyncAfter(deadline: .now() + AnimationConstants.animationDelay) {
                guard isAnimatingForward && isAnimating else {
                    print("\(CFAbsoluteTimeGetCurrent()): Delay finished, but animation state changed. Ignoring return trigger.")
                    return
                }

                let delayEndTime = CFAbsoluteTimeGetCurrent()
                print("\(delayEndTime): Delay finished. Starting return animation.")

                isAnimatingForward = false

                withAnimation(.easeInOut(duration: AnimationConstants.duration)) {
                    print("\(delayEndTime): Applying return animation to startTrim.")
                    drawProgress = AnimationConstants.startTrim
                } completion: {
                    guard !isAnimatingForward && isAnimating else {
                        print("\(CFAbsoluteTimeGetCurrent()): Return animation completion called, but state is unexpected. Ignoring reset.")
                        return
                    }
                    let returnEndTime = CFAbsoluteTimeGetCurrent()
                    print("\(returnEndTime): Return animation visually completed. Animation cycle complete.")
                    isAnimatingForward = true
                    isAnimating = false
                }
            }
        }
    }
}
