// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CasingTools",
    products: [
        .executable(name: "casing", targets: ["CasingTools"]),
        .library(name: "CasingTools", targets: ["CasingTools"]),
    ],
    dependencies: [
        .package(url: "https://github.com/kareman/Moderator.git", from: "0.5.0"),
    ],
    targets: [
        .target(
            name: "CasingTools",
            dependencies: ["Moderator"]),
        .testTarget(
            name: "CasingToolsTests",
            dependencies: ["CasingTools"]),
    ]
)
