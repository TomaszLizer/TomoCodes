// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TomoCodes",
    platforms: [.macOS(.v14)],
    dependencies: [
        .package(path: "../Ignite")
    ],
    targets: [
        .executableTarget(
            name: "TomoCodes",
            dependencies: ["Ignite"]),
    ]
)
