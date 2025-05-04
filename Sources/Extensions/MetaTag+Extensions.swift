//
//  MetaTag+Extensions.swift
//  TomoCodes
//
//  Created by Tomasz Lizer on 04/05/2025.
//

import Ignite
import SwiftUI

extension MetaTag {
    
    static func themeColor(
        _ resource: ColorResource,
        scheme: Ignite.ColorScheme
    ) -> MetaTag {
        let color = Ignite.Color(resource, scheme: scheme)
        let content = "rgb(\(color.red) \(color.green) \(color.blue))"
        let media = "(prefers-color-scheme: \(scheme.rawValue)"
        return MetaTag(name: "theme-color", content: content)
            .customAttribute(name: "media", value: media)
    }
}
