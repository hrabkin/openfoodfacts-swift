// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OpenFoodFactsSwift",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "OpenFoodFactsSDK",
            targets: ["OpenFoodFactsSDK"]),
        .executable(
            name: "OpenFoodFactsServiceClient",
            targets: ["OpenFoodFactsServiceClient"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/hrabkin/BarcodeView.git", branch: "master"),
        .package(url: "https://github.com/TimOliver/TOCropViewController.git", from: "2.6.1"),
         package(url: "https://github.com/apple/swift-openapi-generator", from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-openapi-runtime", from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-openapi-urlsession", from: "1.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "OpenFoodFactsSDK",
            dependencies: ["BarcodeView", "TOCropViewController"]
            path: "Sources/OpenFoodFactsSDK",
        ),
        .testTarget(
            name: "OpenFoodFactsSDK-iosTests",
            dependencies: ["OpenFoodFactsSDK"]
        ),
        .executableTarget(
            name: "OFFOpenAPIClient",
            dependencies: [
                .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime"),
                .product(name: "OpenAPIURLSession", package: "swift-openapi-urlsession"),
            ],
            plugins: [
                .plugin(name: "OpenAPIGenerator", package: "swift-openapi-generator"),
            ],
            path: "Sources/OpenFoodFactsSDKOpenAPIClient"
        )
    ]
)
