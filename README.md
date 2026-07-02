# ZeligStylerSDK (binary distribution)

Closed-source binary Swift package for the Zelig Styler iOS SDK. This repo contains no source code — `Package.swift` declares a `binaryTarget` pointing at the pre-built `ZeligStylerSDK.xcframework`; Xcode downloads and verifies it automatically (SHA-256 checksum).

## Install

Xcode → **File → Add Package Dependencies…** → enter:

```
https://github.com/wearezelig/ZeligStylerSDK-binary.git
```

Choose a version (e.g. `1.0.0`) → add the `ZeligStylerSDK` library to your app target → `import ZeligStylerSDK`.

Or in `Package.swift`:

```swift
.package(url: "https://github.com/wearezelig/ZeligStylerSDK-binary.git", from: "1.0.0")
```

## Docs

Integration guide: contact your Zelig integration lead.

- iOS 13.0+ · Xcode 14+ · Swift 5.7+
