// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "Sync",
    platforms: [
        .iOS("17.0")
    ],
    products: [
        .executable(name: "Sync", targets: ["Sync"]),
    ],
    dependencies: [
        .package(url: "https://github.com/anti-ltd/iUX-iOS", branch: "main"),
    ],
    targets: [
        .executableTarget(
            name: "Sync",
            dependencies: [
                .product(name: "iUXiOS", package: "iUX-iOS")
            ],
            path: "Sync",
            swiftSettings: [
                .define("DEBUG", .when(platforms: [.iOS], configuration: .debug))
            ]
        ),
    ]
)
