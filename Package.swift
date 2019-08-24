// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CasingTools",
    products: [
        .library(name: "CasingTools", targets: ["CasingTools"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "CasingTools",
            dependencies: []),
        .testTarget(
            name: "CasingToolsTests",
            dependencies: ["CasingTools"]),
    ]
)
