//
//  Article+Extensions.swift
//  TomoCodes
//
//  Created by Tomasz Lizer on 10/05/2025.
//

import Ignite

extension Article {
    
    /// Identifier of the article as specified by `id` property in `YAML front matter`.
    ///
    /// See documentation  [](https://jekyllrb.com/docs/front-matter)
    var id: String? {
        metadata["id"] as? String
    }
}
