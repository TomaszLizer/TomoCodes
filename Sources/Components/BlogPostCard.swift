//
//  BlogPostCard.swift
//  TomoCodes
//
//  Created by Tomasz Lizer on 13/05/2025.
//

import Ignite

struct BlogPostCard: HTML {
    
    var article: Article
    
    var body: some HTML {
        VStack(alignment: .leading) {
            if let image = article.imageHTML {
                image
            }
            VStack(alignment: .leading) {
                HStack {
                    article.dateAndReadTimeHTML
                    Spacer()
                    ArticleTag(tag: article.tags!.first!)
                }
                .frame(width: .percent(100%))
                Spacer(size: .small)
                Text(article.title)
                    .font(.title5)
            }
            .padding(.medium)
            .class("bg-body-secondary")
            .frame(width: .percent(100%))
        }
        .frame(maxWidth: .px(500))
        .border(.dimGray)
        .cornerRadius(20)
        .clipped()
        .margin(.vertical, .medium)
    }
}
