// swift-tools-version: 6.1.0
import PackageDescription

let package = Package(
    name: "SocialGraph",
    platforms: [
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "SocialGraph",
            targets: ["SocialGraph"]
        ),
        .executable(
            name: "SocialGraphServer",
            targets: ["SocialGraphServer"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/hummingbird-project/hummingbird.git",
            from: "2.0.0"
        )
    ],
    targets: [
        .target(
            name: "SocialGraph"
        ),
        .executableTarget(
            name: "SocialGraphServer",
            dependencies: [
                "SocialGraph",
                .product(name: "Hummingbird", package: "hummingbird"),
            ]
        ),
        .testTarget(
            name: "SocialGraphTests",
            dependencies: ["SocialGraph"]
        ),
    ]
)
