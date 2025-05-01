//
//  LogoNavBar.swift
//  TomoCodes
//
//  Created by Tomasz Lizer on 24/04/2025.
//

import Ignite

struct LogoNavBar: HTML {
    
    var body: some HTML {
        NavigationBar(logo: logo) {
            let pages: [any StaticPage] = []
            for page in pages {
                let item: some InlineElement = page.title
                    .font(font)
                    .font(.small)
                Link(item, target: page)
            }
        }
        .navigationItemAlignment(.trailing)
        .position(.fixedTop)
        .background(.ultraThinMaterial)
        .class("bg-body-secondary", "bg-opacity-50")
    }
    
    private let imageSize: Int = 60
    
    @InlineElementBuilder
    private var logo: some InlineElement {
        Image.tomoCodesIcon
            .frame(height: imageSize)
            .font(.title2)
        "TomoCodes"
            .font(font)
            .font(.lead)
            .foregroundStyle(.body)
    }
    
    private var font: Font { .pressStart2P }
}
