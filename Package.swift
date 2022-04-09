// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "CWasm3",
    products: [
        .library(
            name: "CWasm3",
            targets: ["CWasm3"]
        ),
    ],
    dependencies: [
        .package(name: "ios_system", url: "https://github.com/holzschu/ios_system", from: "3.0.0")
    ],
    targets: [
        .target(
            name: "CWasm3",
            cSettings: [
                .define("APPLICATION_EXTENSION_API_ONLY", to: "YES"),
                .define("d_m3MaxDuplicateFunctionImpl", to: "10"),
            ],
            linkerSettings: [.linkedFramework("ios_system")]
        ),
        .testTarget(
            name: "CWasm3Tests",
            dependencies: ["CWasm3"],
            exclude: [
                "Resources/add.wat",
                "Resources/constant.wat",
                "Resources/fib64.wat",
                "Resources/imported-add.wat",
                "Resources/memory.wat",
            ]),
    ]
)
