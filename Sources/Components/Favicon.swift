//
//  Favicon.swift
//  TomoCodes
//
//  Created by Tomasz Lizer on 27/04/2025.
//

import Ignite

@MainActor
enum Favicon: CaseIterable {
    case shortcut
    case _96px
    case appleTouch
    case manifest
    
    var rel: String {
        switch self {
        case .shortcut, ._96px: "icon"
        case .appleTouch: "apple-touch-icon"
        case .manifest: "manifest"
        }
    }
    
    var href: String {
        "/media/favicons/\(filename)"
    }
    
    var filename: String {
        switch self {
        case .shortcut: "favicon.ico"
        case ._96px: "favicon-96x96.png"
        case .appleTouch: "apple-touch-icon.png"
        case .manifest: "site.webmanifest"
        }
    }
    
    var sizes: String? {
        switch self {
        case .shortcut, .manifest: nil
        case ._96px: "96x96"
        case .appleTouch: "180x180"
        }
    }
    
    var type: String? {
        switch self {
        case .shortcut, .manifest, .appleTouch: nil
        case ._96px: "image/png"
        }
    }
    
    func metalink() -> MetaLink {
        var link = MetaLink(href: href, rel: rel)
        if let sizes = sizes {
            link = link.customAttribute(name: "sizes", value: sizes)
        }
        if let type {
            link = link.customAttribute(name: "type", value: type)
        }
        return link
    }
}
