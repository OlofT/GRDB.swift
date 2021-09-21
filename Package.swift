// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GRDB",
    platforms: [
        .iOS("10.0"),
        .macOS("10.10"),
        .tvOS("9.0"),
        .watchOS("2.0"),
    ],
    products: [
        .library(name: "GRDB", targets: ["GRDB"]),
    ],
    dependencies: [
    ],
    targets: [
        .systemLibrary(name: "CSQLite"),
        .target(
            name: "GRDB",
            dependencies: ["CSQLite"],
            path: "GRDB"),
        .testTarget(
            name: "GRDBTests",
            dependencies: ["GRDB"],
            path: "Tests",
            exclude: [
                "CocoaPods",
                "CustomSQLite",
                "Crash",
                "Performance",
                "SPM",
            ])
    ],
    swiftLanguageVersions: [.v5]
)

/*
 TODO: conditionally import system libraries instead of bundling SQLite for every project.
if false {
    package.targets.first(where: { $0.type == .system })!.path = "Sources/CSQLiteSystem"
    package.targets.first(where: { $0.type == .system })!.
 providers = [.apt(["libsqlite3-dev"])]),
}
*/
