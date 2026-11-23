// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "Thrust",
    platforms: [.macOS(.v13)],
    targets: [
        .executableTarget(
            name: "Thrust",
            path: "Sources/Thrust",
            resources: [.copy("Resources")]
        )
    ]
)
