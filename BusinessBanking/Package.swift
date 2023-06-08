// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BusinessBanking",
    platforms: [.iOS(.v11)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "BusinessBanking",
            targets: ["BusinessBanking"]),
    ],
    dependencies: [
        .package(
            name: "AtlasDesign",
            url: "https://gitlab.redairship.tech/ocbc-frank/ocbc-components-ios.git",
            branch: "dev"
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "BusinessBanking",
            dependencies: [
                "AtlasDesign",
            ]
        )
    ]
)
