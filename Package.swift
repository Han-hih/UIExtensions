// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIExtensions",
    platforms: [
            .iOS(.v15),
        ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "UIExtensions",
            targets: ["UIExtensions"]),
    ],
    dependencies: [
            // 외부 의존성이 필요한 경우 여기에 추가
            // 예: .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.0.0"),
        ],
    targets: [
        .target(
                    name: "UIExtensions",
                    dependencies: [
                        // 의존성 추가 시 여기에 명시
                    ],
                    path: "Sources/UIExtensions"
                ),
    ]
)
