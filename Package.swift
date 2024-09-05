// swift-tools-version: 5.5

import PackageDescription

let package = Package(
    name: "ReusableKit",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "ReusableKit",
            targets: ["ReusableKit"]
        )
    ],
    targets: [
        .target(name: "ReusableKit")
    ]
)
