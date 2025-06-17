//
//  TipItem.swift
//  TomoCodes
//
//  Created by Tomasz Lizer on 14/06/2025.
//

import Ignite

struct TipItem: HTML {
    var article: Article
    
    var body: some HTML {
        CodeBlock(.bash) {
            article.text
        }
    }
}
