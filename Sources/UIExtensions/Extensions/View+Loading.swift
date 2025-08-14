import SwiftUI

public extension View {
    func loading(_ isLoading: Bool, message: String = "로딩 중...") -> some View {
        modifier(LoadingOverlay(isLoading: isLoading, message: message))
    }
}
