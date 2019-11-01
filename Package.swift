// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "CSkiaSwift",
    dependencies: [
    ],
    targets: [
        .target(
            name: "CSkia",
            dependencies: [],
            linkerSettings: [
                .linkedLibrary("skia"),
                .unsafeFlags(["-LSources/CSkia/out/mac"])
            ]),
        .target(
            name: "CSkiaSwift",
            dependencies: ["CSkia"]),
        .target(
            name: "DemoCSkia",
            dependencies: ["CSkia"]),
        .target(
            name: "DemoCSkiaSwift",
            dependencies: ["CSkiaSwift"])
    ],
    cxxLanguageStandard: .cxx14
)
