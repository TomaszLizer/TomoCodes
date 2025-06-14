//
//  RedirectLayout.swift
//  TomoCodes
//
//  Created by Tomasz Lizer on 14/06/2025.
//

import Ignite

struct RedirectLayout: Layout {
    
    var redirect: URL
    
    var body: some Document {
        Head {
            Title("Redirecting...")
            let urlString = redirect.absoluteString
            MetaLink(href: urlString, rel: .canonical)
            MetaTag(httpEquivalent: "refresh", content: "0; url=\(urlString)")
        }
        Body {
            Text("Redirecting...")
        }
    }
}

struct RedirectPage: StaticPage {
    
    var title = "Redirecting..."
    var redirect: URL
    var path: String
    
    var layout: some Layout {
        RedirectLayout(redirect: redirect)
    }
    
    var body: some BodyElement {
        EmptyHTML()
    }
}

extension RedirectPage {
    /// Creates static pages redirecting to new article URLs.
    /// Added for backwards compatibility with old articles links.
    static func redirects() -> [RedirectPage] {
        let paths = [
            "building-swift-package-with-xcodebuild",
            "mac-os-keyboard-navigation",
            "swift-task-actor-inheritance"
        ]
        return paths.compactMap { path in
            let redirect = URL(string: "https://tomo.codes/blog/\(path)")
            guard let redirect else { return nil }
            return RedirectPage(redirect: redirect, path: path)
        }
    }
}




