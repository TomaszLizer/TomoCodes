// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length line_length implicit_return

// MARK: - Files

// swiftlint:disable explicit_type_interface identifier_name
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Files {
  /// Assets.txt
  internal static let assetsTxt = File(name: "Assets", ext: "txt", relativePath: "", mimeType: "text/plain")
  /// CNAME
  internal static let cname = File(name: "CNAME", ext: nil, relativePath: "", mimeType: "application/octet-stream")
  /// css/
  internal enum Css {
    /// css/typewriter-cursor.css
    internal static let typewriterCursorCss = File(name: "typewriter-cursor", ext: "css", relativePath: "css", mimeType: "text/css")
  }
  /// fonts/
  internal enum Fonts {
    /// fonts/Nunito-VariableFont_wght.ttf
    internal static let nunitoVariableFontWghtTtf = File(name: "Nunito-VariableFont_wght", ext: "ttf", relativePath: "fonts", mimeType: "font/ttf")
    /// fonts/PressStart2P-Regular.ttf
    internal static let pressStart2PRegularTtf = File(name: "PressStart2P-Regular", ext: "ttf", relativePath: "fonts", mimeType: "font/ttf")
  }
  /// media/
  internal enum Media {
    /// media/Images.txt
    internal static let imagesTxt = File(name: "Images", ext: "txt", relativePath: "media", mimeType: "text/plain")
    /// media/PixAvatar.webp
    internal static let pixAvatarWebp = File(name: "PixAvatar", ext: "webp", relativePath: "media", mimeType: "image/webp")
    /// media/TomoCodes Icon.webp
    internal static let tomoCodesIconWebp = File(name: "TomoCodes Icon", ext: "webp", relativePath: "media", mimeType: "image/webp")
    /// media/favicons/
    internal enum Favicons {
      /// media/favicons/apple-touch-icon.png
      internal static let appleTouchIconPng = File(name: "apple-touch-icon", ext: "png", relativePath: "media/favicons", mimeType: "image/png")
      /// media/favicons/favicon.ico
      internal static let faviconIco = File(name: "favicon", ext: "ico", relativePath: "media/favicons", mimeType: "image/vnd.microsoft.icon")
      /// media/favicons/favicon-96x96.png
      internal static let favicon96x96Png = File(name: "favicon-96x96", ext: "png", relativePath: "media/favicons", mimeType: "image/png")
      /// media/favicons/site.webmanifest
      internal static let siteWebmanifest = File(name: "site", ext: "webmanifest", relativePath: "media/favicons", mimeType: "application/octet-stream")
      /// media/favicons/web-app-manifest-192x192.png
      internal static let webAppManifest192x192Png = File(name: "web-app-manifest-192x192", ext: "png", relativePath: "media/favicons", mimeType: "image/png")
      /// media/favicons/web-app-manifest-512x512.png
      internal static let webAppManifest512x512Png = File(name: "web-app-manifest-512x512", ext: "png", relativePath: "media/favicons", mimeType: "image/png")
    }
    /// media/mac-os-keyboard-navigation/
    internal enum MacOsKeyboardNavigation {
      /// media/mac-os-keyboard-navigation/header.webp
      internal static let headerWebp = File(name: "header", ext: "webp", relativePath: "media/mac-os-keyboard-navigation", mimeType: "image/webp")
      /// media/mac-os-keyboard-navigation/keyboard-navigation-settings-dark.webp
      internal static let keyboardNavigationSettingsDarkWebp = File(name: "keyboard-navigation-settings-dark", ext: "webp", relativePath: "media/mac-os-keyboard-navigation", mimeType: "image/webp")
      /// media/mac-os-keyboard-navigation/keyboard-navigation-settings-light.webp
      internal static let keyboardNavigationSettingsLightWebp = File(name: "keyboard-navigation-settings-light", ext: "webp", relativePath: "media/mac-os-keyboard-navigation", mimeType: "image/webp")
      /// media/mac-os-keyboard-navigation/kn_disabled-dark.mp4
      internal static let knDisabledDarkMp4 = File(name: "kn_disabled-dark", ext: "mp4", relativePath: "media/mac-os-keyboard-navigation", mimeType: "video/mp4")
      /// media/mac-os-keyboard-navigation/kn_disabled-light.mp4
      internal static let knDisabledLightMp4 = File(name: "kn_disabled-light", ext: "mp4", relativePath: "media/mac-os-keyboard-navigation", mimeType: "video/mp4")
      /// media/mac-os-keyboard-navigation/kn_enabled-dark.mp4
      internal static let knEnabledDarkMp4 = File(name: "kn_enabled-dark", ext: "mp4", relativePath: "media/mac-os-keyboard-navigation", mimeType: "video/mp4")
      /// media/mac-os-keyboard-navigation/kn_enabled-light.mp4
      internal static let knEnabledLightMp4 = File(name: "kn_enabled-light", ext: "mp4", relativePath: "media/mac-os-keyboard-navigation", mimeType: "video/mp4")
    }
  }
  /// scripts/
  internal enum Scripts {
    /// scripts/cusdis-theme-support.js
    internal static let cusdisThemeSupportJs = File(name: "cusdis-theme-support", ext: "js", relativePath: "scripts", mimeType: "text/javascript")
    /// scripts/theme-aware-video.js
    internal static let themeAwareVideoJs = File(name: "theme-aware-video", ext: "js", relativePath: "scripts", mimeType: "text/javascript")
    /// scripts/typewriter.js
    internal static let typewriterJs = File(name: "typewriter", ext: "js", relativePath: "scripts", mimeType: "text/javascript")
  }
}
// swiftlint:enable explicit_type_interface identifier_name
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

internal struct File {
  internal let name: String
  internal let ext: String?
  internal let relativePath: String
  internal let mimeType: String

  internal var url: URL {
    return url(locale: nil)
  }

  internal func url(locale: Locale?) -> URL {
    let bundle = BundleToken.bundle
    let url = bundle.url(
      forResource: name,
      withExtension: ext,
      subdirectory: relativePath,
      localization: locale?.identifier
    )
    guard let result = url else {
      let file = name + (ext.flatMap { ".\($0)" } ?? "")
      fatalError("Could not locate file named \(file)")
    }
    return result
  }

  internal var path: String {
    return path(locale: nil)
  }

  internal func path(locale: Locale?) -> String {
    return url(locale: locale).path
  }
}

// swiftlint:disable convenience_type explicit_type_interface
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type explicit_type_interface
