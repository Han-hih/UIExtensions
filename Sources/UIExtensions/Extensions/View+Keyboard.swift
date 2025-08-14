import SwiftUI

// 포커스 상태 관리형: SwiftUI 방식
public extension View {
    func keyboardToolbarDone(dismiss action: @escaping () -> Void) -> some View {
        toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("완료") { action() }
            }
        }
    }
    
    func hideKeyboardOnTap(using focused: FocusState<Bool>.Binding) -> some View {
        onTapGesture { focused.wrappedValue = false }
    }
}
