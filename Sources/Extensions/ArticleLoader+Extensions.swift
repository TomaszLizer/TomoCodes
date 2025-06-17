//
//  ArticleLoader+Extensions.swift
//  TomoCodes
//
//  Created by Tomasz Lizer on 13/05/2025.
//

import Ignite

enum ArticleType: String {
    case blog
    case tip
}

extension ArticleLoader {
    
    func typed(_ type: ArticleType) -> [Article] {
        self.typed(type.rawValue)
    }
}
