# ZeligStylerSDK — binary distribution

Closed-source binary distribution of the Zelig Styler iOS SDK. There is no source code here — only the package-manager pointers that download and verify the pre-built `ZeligStylerSDK.xcframework`.

## What's in this repo

| File | Purpose |
|------|---------|
| `Package.swift` | Swift Package Manager support — declares the `binaryTarget` (xcframework zip URL + SHA-256 checksum). |
| `ZeligStylerSDK.podspec` | CocoaPods support — points at the same pre-built xcframework zip. |
| `INTEGRATION_GUIDE.pdf` | The iOS integration guide — install, API, and the add-to-cart bridge. |

## Install

**Swift Package Manager** — Xcode → **File → Add Package Dependencies…** →

```
https://github.com/wearezelig/ZeligStylerSDK-binary.git
```

Dependency Rule → **Up to Next Major Version** from `1.0.0`.

**CocoaPods** — in your `Podfile`:

```ruby
pod 'ZeligStylerSDK', :podspec => 'https://raw.githubusercontent.com/wearezelig/ZeligStylerSDK-binary/1.0.0/ZeligStylerSDK.podspec'
```

Then `import ZeligStylerSDK`.

## Integration guide

See [INTEGRATION_GUIDE.pdf](INTEGRATION_GUIDE.pdf).
