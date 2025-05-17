//
//  PostsGrid.swift
//  TomoCodes
//
//  Created by Tomasz Lizer on 13/05/2025.
//

import Ignite

struct PostsGrid: HTML {
    
    var articles: [Article]
    
    var body: some HTML {
        Grid {
            ForEach(articles) { article in
                LinkGroup(target: article.path) {
                    BlogPostCard(article: article)
                        .hoverEffect { hoverItem in
                            hoverItem.body
                                // workaround for bug with shadow
                                .cornerRadius(20)
                                .shadow(.gray, radius: 15, x: 5, y: 5)
                        }
                        .transition(.scale(from: 1, to: 1.01), on: .hover)
                }
                .class("link-primary")
                .width(12)
            }
        }
        .class("justify-content-between")
    }
}
