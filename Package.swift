// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "TradPlusMolocoAdapter",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(
            name: "TradPlusMolocoAdapter",
            targets: ["TradPlusMolocoAdapter"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM.git",
            .exact("15.14.0")
        ),
        .package(
            url: "https://github.com/moloco/moloco-sdk-ios-spm",
            .exact("4.9.1")
        ),
    ],
    targets: [
        .target(
            name: "TradPlusMolocoAdapter",
            dependencies: [
                .target(name: "TPMolocoAdapter"),
                .product(name: "TradPlusAdSDK", package: "TradPlusAdSDK-SPM"),
                .product(name: "MolocoSDK", package: "moloco-sdk-ios-spm"),
            ],
            path: ".",
            sources: ["Sources/TradPlusMolocoAdapter/TradPlusMolocoAdapter.swift"]
        ),
        .binaryTarget(
            name: "TPMolocoAdapter",
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-Moloco/releases/download/15.14.0/TPMolocoAdapter-15.14.0.xcframework.zip",
            checksum: "29e1999982d30ca5ef0f81cd23f697da2c3511e298142a2d70fc411966b63694"
        ),
    ]
)
