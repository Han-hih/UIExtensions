import SwiftUI

public struct ToastConfig {
    public var text: String
    public var duration: Double = 2.0
    
    public init(text: String, duration: Double = 2.0) {
        self.text = text
        self.duration = duration
    }
}

public struct ToastModifier: ViewModifier {
    @Binding var isPresented: Bool
    let config: ToastConfig
    
    public init(isPresented: Binding<Bool>, config: ToastConfig) {
        self._isPresented = isPresented
        self.config = config
    }
    
    public func body(content: Content) -> some View {
        ZStack {
            content
            if isPresented {
                VStack {
                    Spacer()
                    Text(config.text)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        .background(.black.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.bottom, 40)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + config.duration) {
                        withAnimation { isPresented = false }
                    }
                }
            }
        }
        .animation(.easeInOut, value: isPresented)
    }
}

