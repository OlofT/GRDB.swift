This is a fork of [the GRDB toolkit](https://github.com/groue/GRDB.swift) to cross-compile GRDB on Android as well as all other platforms. GRDB is a toolkit for SQLite databases, with a focus on application development

![Swift 5.4 and up](https://img.shields.io/badge/swift-5.4-orange.svg?style=flat)
![Built for Linux, Android, iOS and mac](https://img.shields.io/badge/platform-Android%20%7C%20Linux%20%7C%20iOS%20%7C%20macOS%20%7C%20watchOS%20%7C%20tvOS%20-red)

# Install

Use SPM, include in the dependency section:

    .package(name: "GRDB", url: "https://github.com/OlofT/GRDB.swift", .branch("Android")),

And in target dependencies:

    targets: [
        .target(
            name: ...,
            dependencies: [..., "GRDB"]),

---

Built on GRDB released: May 16, 2021 • version 5.8.0 
