import SwiftUI

public struct LoadingOverlay: ViewModifier {
    let isLoading: Bool
    let message: String
    
    public func body(content: Content) -> some View {
        ZStack {
            content
                .disabled(isLoading)
                .blur(radius: isLoading ? 1 : 0)
            
            if isLoading {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                
                VStack(spacing: 12) {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .scaleEffect(1.2)
                    
                    Text(message)
                        .foregroundColor(.white)
                        .font(.body)
                }
                .padding(20)
                .background(Color.black.opacity(0.7))
                .cornerRadius(12)
            }
        }
        .animation(.easeInOut(duration: 0.2), value: isLoading)
    }
}
