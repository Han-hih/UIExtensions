import SwiftUI

public struct Shimmer: ViewModifier {
    @State private var phase: CGFloat = -1
    let active: Bool
    
    public init(active: Bool = true) {
        self.active = active
    }
    
    public func body(content: Content) -> some View {
        content
            .redacted(reason: active ? .placeholder : [])
            .overlay(
                active ?
                LinearGradient(gradient: Gradient(colors: [.clear, .white.opacity(0.6), .clear]),
                               startPoint: .leading, endPoint: .trailing)
                    .rotationEffect(.degrees(20))
                    .offset(x: phase * 300) : nil
            )
            .onAppear {
                if active {
                    withAnimation(.linear(duration: 1.2).repeatForever(autoreverses: false)) {
                        phase = 1.5
                    }
                }
            }
    }
}
