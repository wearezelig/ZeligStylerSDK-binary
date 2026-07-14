# Binary (closed-source) podspec - what third-party CocoaPods consumers install.
# No source files are compiled; CocoaPods downloads and links the pre-built
# XCFramework produced by scripts/build-xcframework.sh.
#
# Published via this repo's tags: customers point their Podfile at
#   https://raw.githubusercontent.com/wearezelig/ZeligStylerSDK-binary/<tag>/ZeligStylerSDK.podspec
# (or /main/ to follow latest). No separate hosting. Keep this file pure ASCII -
# non-ASCII characters break CocoaPods' URL-podspec fetch
# (Encoding::UndefinedConversionError).
#
# Publishing a new version (order matters):
#   1. In the SDK repo run `scripts/build-xcframework.sh` -> new zip + checksum.txt.
#   2. Upload the zip to OSS under a NEW versioned filename; NEVER overwrite or
#      delete previously published zips (existing customers still resolve them).
#   3. Update `spec.version`, `:http` and `:sha256` below AND Package.swift's
#      url/checksum, then ONE commit + tag <version> + push. The podspec must be
#      in the tagged commit or the tag raw URL 404s.
#
# (The source podspec at the SDK repo root compiles from source for internal
# `:path` development and is NOT what third parties consume.)
Pod::Spec.new do |spec|
  spec.name         = "ZeligStylerSDK"
  spec.version      = "1.0.0"
  spec.summary      = "Zelig Styler SDK for iOS - embed the Zelig styling widget"
  spec.description  = <<-DESC
    The Zelig Styler SDK embeds a web-based styling widget in your iOS app.
    Customers can build looks, try on products, and add items to their cart.
  DESC

  spec.homepage     = "https://github.com/wearezelig/ZeligStylerSDKWebView-IOS"
  spec.license      = { :type => "Commercial" }
  spec.author       = { "Zelig" => "support@zelig.com" }

  spec.platform     = :ios, "13.0"
  spec.swift_version = "5.0"

  # Closed-source binary distribution.
  spec.source = {
    :http => "https://storage.googleapis.com/ios-widget-sdk-zelig-prod/ZeligStylerSDK-1.0.0.xcframework.zip",
    :type => :zip,
    :sha256 => "8410d58dedf61aa0c7ac1518a6a77380de942b0d2bd903f65642ab9d37bb38bc"
  }
  spec.vendored_frameworks = "ZeligStylerSDK.xcframework"

  spec.frameworks   = "UIKit", "WebKit", "SwiftUI"
  spec.requires_arc = true
end
