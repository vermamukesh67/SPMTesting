// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AtlasDesign",
    platforms: [.iOS(.v11)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "AtlasDesign",
            targets: ["AtlasDesign"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/RedAirship/SwiftTheme.git", branch: "master"),

        // Use of Lottie animation may output warnings like the following:
        // - nil host used in call to allowsSpecificHTTPSCertificateForHost
        // - nil host used in call to allowsAnyHTTPSCertificateForHost:
        //
        // airbnb bug ref: https://github.com/airbnb/lottie-ios/issues/1256
        // airbnb bug fix: https://github.com/airbnb/lottie-ios/pull/1524
        // airbnb tagged versions: https://github.com/airbnb/lottie-ios/tags?after=3.4.2
        // ocbc notified: https://rasxocbc.slack.com/archives/C0448L5TQP6/p1678692484570569
        .package(name: "Lottie", url: "https://github.com/airbnb/lottie-ios.git", .exact("3.3.0")),

        // This url allows AppCenter to build successfully
        // We might need to investigate why AppCenter cannot fetch the packages from Gitlab
        .package(url: "https://github.com/RedAirship/JTAppleCalendar.git", branch: "master")
        // .package(url: "https://gitlab.redairship.tech/ocbc-frank/JTAppleCalendar.git", branch: "master")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "AtlasDesign",
            dependencies: [
                "SwiftTheme",
                "Lottie",
                "JTAppleCalendar"
            ],
            resources: [
                .copy("Resources/Fonts/"),
                .copy("Resources/Themes/")
            ]
        ),
    ]
)
