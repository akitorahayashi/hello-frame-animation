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
                .onChange(of: drawProgress) { _, newValue in
                    if newValue == AnimationConstants.endTrim, isAnimatingForward {
                        DispatchQueue.main.asyncAfter(deadline: .now() + AnimationConstants.animationDelay) {
                            isAnimatingForward = false
                            withAnimation(.easeInOut(duration: AnimationConstants.duration)) {
                                drawProgress = AnimationConstants.startTrim
                            }
                        }
                    } else if newValue == AnimationConstants.startTrim, !isAnimatingForward {
                        isAnimatingForward = true
                        isAnimating = false
                    }
                }
                .contentShape(Rectangle())
                .onAppear {
                    startAnimation()
                }
                .onTapGesture {
                    if !isAnimating {
                        startAnimation()
                    }
                }
        }
    }

    // アニメーションを開始する関数
    func startAnimation() {
        guard !isAnimating else { return }

        isAnimating = true
        drawProgress = AnimationConstants.startTrim

        // アニメーションで描画を進める
        withAnimation(.easeInOut(duration: AnimationConstants.duration)) {
            drawProgress = AnimationConstants.endTrim
        }
    }
}
