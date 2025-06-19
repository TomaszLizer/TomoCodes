// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TomoCodes",
    platforms: [.macOS(.v14)],
    dependencies: [
        .package(url: "https://github.com/twostraws/Ignite.git", from: "0.6.0"),
        .package(url: "https://github.com/SwiftGen/SwiftGenPlugin", from: "6.6.0"),
    ],
    targets: [
        .executableTarget(
            name: "TomoCodes",
            dependencies: ["Ignite"],
            path: "Sources",
            resources: [.process("Resources/Colors.xcassets")],
            plugins: [
//                Disabled due to issue with Xcode 16.3; works just fine with Xcode 16.2 (via swift build)
//                .plugin(name: "SwiftGenPlugin", package: "SwiftGenPlugin")
            ]
        ),
    ]
)
