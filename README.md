# ZeligStylerSDK (binary distribution)

Closed-source binary Swift package for the Zelig Styler iOS SDK. This repo contains no source code — `Package.swift` declares a `binaryTarget` pointing at the pre-built `ZeligStylerSDK.xcframework`; Xcode downloads and verifies it automatically (SHA-256 checksum).

The repo URL is the same for everyone — **which environment you get is decided by how you pin the dependency**, not by the URL:

| Channel | Backend | How to pin | Pinned to |
|---------|---------|------------|-----------|
| **Production** | `zelig-widget.zelig.com` | a version (git tag) | an exact, immutable release |
| **Development** *(internal)* | `zelig-widget.dev.zelig.com` | the `dev` branch | the latest dev build (rolling) |

Both link the same module — `import ZeligStylerSDK` in code, regardless of channel.

## Install — Production (default)

For shipping apps. Pin a released **version**; that tag never changes, so your build is reproducible.

Xcode → **File → Add Package Dependencies…** → enter:

```
https://github.com/wearezelig/ZeligStylerSDK-binary.git
```

Dependency Rule → **Up to Next Major Version** (e.g. `1.0.0`) → add the `ZeligStylerSDK` library to your app target.

Or in `Package.swift`:

```swift
.package(url: "https://github.com/wearezelig/ZeligStylerSDK-binary.git", from: "1.0.0")
```

## Install — Development (internal / testing only)

For internal integration testing against the Zelig **dev** backend. **Not for release builds.**

Same repo URL, but Dependency Rule → **Branch** → `dev`:

```swift
.package(url: "https://github.com/wearezelig/ZeligStylerSDK-binary.git", branch: "dev")
```

The `dev` branch is a **rolling pointer** — it always tracks the latest dev build, not a fixed version. To pick up a new dev build: **File → Packages → Update to Latest Package Versions** (or Reset Package Caches if it doesn't refresh).

## Switching an existing dependency between channels

In your app, select the package under **Package Dependencies**, change its **Dependency Rule** (Version ↔ Branch `dev`), then **File → Packages → Update to Latest Package Versions**.

## Docs

Integration guide: contact your Zelig integration lead.

- iOS 13.0+ · Xcode 14+ · Swift 5.7+
