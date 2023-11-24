// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "RandomizedReplica",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6), .visionOS(.v1)],
    products: [
        .library(name: "RandomizedReplica", targets: ["RandomizedReplica"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-macro-testing", from: .init(0, 2, 0)),
        .package(url: "https://github.com/apple/swift-syntax.git", from: .init(509, 0, 0)),
    ],
    targets: [
        // Library that exposes a macro as part of its API, which is used in client programs.
        .target(
            name: "RandomizedReplica",
            dependencies: [
                "RandomizedReplicaMacros",
            ],
            swiftSettings: [.enableExperimentalFeature("StrictConcurrency=complete")]
        ),

        // Macro implementation that performs the source transformation of a macro.
        .macro(
            name: "RandomizedReplicaMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax"),
            ],
            swiftSettings: [.enableExperimentalFeature("StrictConcurrency=complete")]
        ),

        // A test target used to develop the macro implementation.
        .testTarget(
            name: "RandomizedReplicaMacrosTests",
            dependencies: [
                "RandomizedReplicaMacros",
                .product(name: "MacroTesting", package: "swift-macro-testing"),
            ]
        ),
    ]
)
