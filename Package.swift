// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TomoCodes",
    platforms: [.macOS(.v14)],
    dependencies: [
        .package(url: "https://github.com/twostraws/Ignite.git", branch: "v0.6-beta")
    ],
    targets: [
        .executableTarget(
            name: "TomoCodes",
            dependencies: ["Ignite"]),
    ]
)
