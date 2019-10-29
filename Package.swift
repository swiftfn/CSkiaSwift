// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "Swifia",
    dependencies: [
    ],
    targets: [
        .target(
            name: "CSkia",
            dependencies: [],
            linkerSettings: [
                .linkedLibrary("skia"),
                .unsafeFlags(["-Lout/mac"])
            ]),
        .target(
            name: "Swifia",
            dependencies: ["CSkia"]),
        .target(
            name: "DemoCSkia",
            dependencies: ["CSkia"]),
        .target(
            name: "DemoSwifia",
            dependencies: ["Swifia"])
    ],
    cxxLanguageStandard: .cxx14
)
