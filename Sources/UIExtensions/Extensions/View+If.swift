import SwiftUI


// 조건부 View 표시/적용
public extension View {
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition { transform(self) } else { self }
    }
    
    @ViewBuilder
    func optional<Wrapped, Content: View>(_ value: Wrapped?, transform: (Self, Wrapped) -> Content) -> some View {
        if let v = value { transform(self, v) } else { self }
    }
}
