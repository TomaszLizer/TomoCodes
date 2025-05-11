//
//  Article+Extensions.swift
//  TomoCodes
//
//  Created by Tomasz Lizer on 10/05/2025.
//

import Ignite

// MARK: Convenience

extension Article {
    
    /// Identifier of the article as specified by `id` property in `YAML front matter`.
    ///
    /// See documentation  [](https://jekyllrb.com/docs/front-matter)
    var id: String? {
        metadata["id"] as? String
    }
    
    /// Checks whether article was updated after it was published.
    var isUpdated: Bool {
        lastModified > date
    }
}

// MARK: HTML elements

extension Article {
    
    @InlineElementBuilder
    var dateAndReadTimeHTML: some InlineElement {
        let dateString = date.formatted(date: .long, time: .omitted)
        "\(dateString) · \(estimatedReadingMinutes) min read"
    }
    
    @InlineElementBuilder
    var updateDateHTML: some InlineElement {
        let updateDate = lastModified.formatted(date: .long, time: .omitted)
        "Updated \(updateDate)"
    }
    
    /// Resizable image HTML if image path exists.
    var imageHTML: Image? {
        image.map { Image($0, description: imageDescription).resizable() }
    }
}
