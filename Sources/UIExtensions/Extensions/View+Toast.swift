import SwiftUI

// Toast
public extension View {
    func toast(isPresented: Binding<Bool>, config: ToastConfig) -> some View {
        modifier(ToastModifier(isPresented: isPresented, config: config))
    }
}
