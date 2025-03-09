// 円形表示ビュー
struct CircularView: View {
    let data: [CGFloat]
    let isPlaying: Bool
    
    var body: some View {
        ZStack {
            ForEach(0..<12, id: \.self) { index in
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.purple, .blue]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: isPlaying ? 
                           (data[index % data.count] * 70) : 25)
                    .offset(x: 50 * cos(CGFloat(index) * .pi / 6),
                            y: 40 * sin(CGFloat(index) * .pi / 6))
                    .opacity(0.7)
                    .animation(.easeInOut(duration: 0.2), value: data[index])
            }
        }
    }
}