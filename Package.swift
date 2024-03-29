// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "tailwind_vapor",
    platforms: [
        .macOS(.v13)
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.89.0"),
        // Leaf templating language
        .package(url: "https://github.com/vapor/leaf.git", from: "4.0.0"),
        // Tailwind CSS
        .package(url: "https://github.com/tuist/SwiftyTailwind.git", .upToNextMinor(from: "0.5.0"))
    ],
    targets: [
        .executableTarget(
            name: "App",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                // Leaf templating language
                .product(name: "Leaf", package: "leaf"),
                // Tailwind CSS
                .product(name: "SwiftyTailwind", package: "SwiftyTailwind")
            ]
        ),
        .testTarget(name: "AppTests", dependencies: [
            .target(name: "App"),
            .product(name: "XCTVapor", package: "vapor"),
            
            // Workaround for https://github.com/apple/swift-package-manager/issues/6940
            .product(name: "Vapor", package: "vapor"),
        ])
    ]
)
