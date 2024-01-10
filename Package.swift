// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftyHELib",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SwiftyHELib",
            targets: ["ObjCHELib","SwiftyHELib"]),
    ],
    targets: [
        .target(
            name: "ObjCHELib",
            path: "Sources/ObjC",
            cxxSettings: [
                .headerSearchPath("../CPP/"),
//                .headerSearchPath("../CPP/include"),
                .headerSearchPath("../CPP/build/helib_pack/include/")
            ]
        ),
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SwiftyHELib",
            dependencies: ["ObjCHELib"],
            path: "Sources/SwiftyHELib"
        ),

    ]
)
