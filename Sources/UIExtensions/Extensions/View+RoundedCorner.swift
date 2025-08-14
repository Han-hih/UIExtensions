import SwiftUI

// 특정 부분만 Round처리
public extension View {
    @available(macOS 13.0, *)
    @available(iOS 16.0, *)
    func cornerRadius(_ radius: CGFloat, corners: CornerSet) -> some View {
        clipShape(
            UnevenRoundedRectangle(
                topLeadingRadius: corners.contains(.topLeft) ? radius : 0,
                bottomLeadingRadius: corners.contains(.bottomLeft) ? radius : 0,
                bottomTrailingRadius: corners.contains(.bottomRight) ? radius : 0,
                topTrailingRadius: corners.contains(.topRight) ? radius : 0
            )
        )
    }
}

// 사용자 정의 CornerSet
public struct CornerSet: OptionSet, Sendable {
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public static let topLeft = CornerSet(rawValue: 1 << 0)
    public static let topRight = CornerSet(rawValue: 1 << 1)
    public static let bottomLeft = CornerSet(rawValue: 1 << 2)
    public static let bottomRight = CornerSet(rawValue: 1 << 3)
    public static let allCorners: CornerSet = [.topLeft, .topRight, .bottomLeft, .bottomRight]
}
