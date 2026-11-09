// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "TradPlusMolocoAdapter",
    platforms: [
        .iOS(.v13),
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
            .exact("15.18.0")
        ),
        .package(
            url: "https://github.com/moloco/moloco-sdk-ios-spm",
            .exact("4.12.0")
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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-Moloco/releases/download/15.18.0/TPMolocoAdapter-15.18.0.xcframework.zip",
            checksum: "7f2997df670262f179e2f9f56c6c108dd4871d428f847bbb483bd95e37cd6257"
        ),
    ]
)
