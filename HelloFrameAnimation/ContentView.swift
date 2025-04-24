import SwiftUI

struct ContentView: View {
    private struct DesignConstants {
        static let lineWidth: CGFloat = 3
        static let gradientColors: [Color] = [.pink, .purple, .cyan]
    }

    private struct AnimationConstants {
        static let duration: Double = 5.3
        static let animationDelay: Double = 6.0
        static let startTrim: CGFloat = 0.0
        static let endTrim: CGFloat = 1.0
    }

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
                .onChange(of: drawProgress) { oldValue, newValue in
                    if newValue == AnimationConstants.endTrim && isAnimatingForward {
                        DispatchQueue.main.asyncAfter(deadline: .now() + AnimationConstants.animationDelay) {
                            isAnimatingForward = false
                            withAnimation(.easeInOut(duration: AnimationConstants.duration)) {
                                drawProgress = AnimationConstants.startTrim
                            }
                        }
                    } else if newValue == AnimationConstants.startTrim && !isAnimatingForward {
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
