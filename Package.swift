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
            .exact("15.16.0")
        ),
        .package(
            url: "https://github.com/moloco/moloco-sdk-ios-spm",
            .exact("4.10.0")
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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-Moloco/releases/download/15.16.0/TPMolocoAdapter-15.16.0.xcframework.zip",
            checksum: "4115390edf8661768a9beb5d02af1b7471b9f075385f2d07c59caef57f4efbc9"
        ),
    ]
)
