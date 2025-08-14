import SwiftUI

public extension View {
    func shimmer(_ active: Bool = true) -> some View {
        modifier(Shimmer(active: active))
    }
}

