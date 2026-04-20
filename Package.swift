// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "pricingday",
    platforms: [
        .macOS(.v12), .iOS(.v15)
    ],
    products: [
        .library(name: "pricingday", targets: ["pricingday"]),
    ],
    targets: [
        .target(
            name: "pricingday",
            path: "src"
        ),
    ]
)
