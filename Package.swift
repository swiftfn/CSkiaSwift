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
            name: "Demo",
            dependencies: ["CSkia"])
    ],
    cxxLanguageStandard: .cxx14
)
