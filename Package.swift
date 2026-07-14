// swift-tools-version:5.6
//
// Binary Swift package - the CONTENT of the closed-source wrapper repository
// (`ZeligStylerSDK-binary`). This repo holds no source code: it only declares
// where Xcode downloads the pre-built XCFramework from, and the SHA-256 checksum
// to verify it. Third-party apps add THIS repo's URL as their SPM dependency.
//
// Publishing a new version:
//   1. Run `scripts/build-xcframework.sh` -> produces build/ZeligStylerSDK-<ver>.xcframework.zip
//      and build/checksum.txt.
//   2. Upload that exact zip to a stable https URL (GitHub Release asset / CDN).
//   3. Set `url` and `checksum` below to match the uploaded file.
//   4. Tag this wrapper repo with the version (e.g. 1.0.0).
//
// IMPORTANT: the checksum below is bound to the exact bytes of the zip produced
// by scripts/build-xcframework.sh for version 1.0.0. Replace <RELEASE_HOST> with
// the real host before tagging; the zip at that URL must be byte-identical to
// build/ZeligStylerSDK-1.0.0.xcframework.zip or the checksum will not verify.
//
import PackageDescription

let package = Package(
    name: "ZeligStylerSDK",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "ZeligStylerSDK", targets: ["ZeligStylerSDK"])
    ],
    targets: [
        .binaryTarget(
            name: "ZeligStylerSDK",
            url: "https://storage.googleapis.com/ios-widget-sdk-zelig-prod/ZeligStylerSDK-1.0.0.xcframework.zip",
            checksum: "8410d58dedf61aa0c7ac1518a6a77380de942b0d2bd903f65642ab9d37bb38bc"
        )
    ]
)
