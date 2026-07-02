# Binary (closed-source) podspec - what third-party CocoaPods consumers install.
# No source files are compiled; CocoaPods downloads and links the pre-built
# XCFramework produced by scripts/build-xcframework.sh.
#
# This file is BOTH the maintained source and the published artifact: upload it
# as-is to https://zelig-sdk.oss-cn-beijing.aliyuncs.com/ZeligStylerSDK.podspec
# (the URL filename must equal the pod name). Keep it pure ASCII - non-ASCII
# characters break CocoaPods' URL-podspec fetch (Encoding::UndefinedConversionError).
#
# Publishing a new version (order matters):
#   1. Run `scripts/build-xcframework.sh` -> build/ZeligStylerSDK-<ver>.xcframework.zip
#      + build/checksum.txt.
#   2. Upload the zip to OSS under a NEW versioned filename; NEVER overwrite or
#      delete previously published zips (existing customers still resolve them).
#   3. Update `spec.version`, `:http` and `:sha256` below.
#   4. Upload this file to OSS, overwriting the previous podspec (safe - the lock
#      of already-integrated customers pins their old version).
#
# (The source podspec at the repo root, ZeligStylerSDK.podspec, compiles from
# source for internal `:path` development and is NOT what third parties consume.)
Pod::Spec.new do |spec|
  spec.name         = "ZeligStylerSDK"
  spec.version      = "1.0.1"
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
    :http => "https://zelig-sdk.oss-cn-beijing.aliyuncs.com/ZeligStylerSDK-1.0.1.xcframework.zip",
    :type => :zip,
    :sha256 => "b17ff3d90703d2f2ebf098722fc68798e48bdfb143bee0943f7caf0f3aec63e4"
  }
  spec.vendored_frameworks = "ZeligStylerSDK.xcframework"

  spec.frameworks   = "UIKit", "WebKit", "SwiftUI"
  spec.requires_arc = true
end
