// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WSDomain",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "WSDomain",
            targets: ["WSDomain"]
        ),
    ],
    dependencies: [
    
    ],
    targets: [
        .target(
            name: "WSDomain",
            dependencies: []
        ),
        .testTarget(
            name: "WSDomainTests",
            dependencies: ["WSDomain"]
        ),
    ]
)
