//
//  ArticleTag.swift
//  TomoCodes
//
//  Created by Tomasz Lizer on 13/05/2025.
//

import Ignite

struct ArticleTag: InlineElement {
    
    var tag: String
    
    var body: some InlineElement {
        Badge(tag)
            .badgeStyle(.subtleBordered)
            .role(.secondary)
    }
}
