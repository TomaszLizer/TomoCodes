//
//  DefaultArticlePage.swift
//  TomoCodes
//
//  Created by Tomasz Lizer on 09/05/2025.
//

import Ignite

@MainActor
enum ThemeAwareVideo {
    static var script: Script { Script(file: "/scripts/theme-aware-video.js") }
    
    static func isIn(_ article: Article) -> Bool {
        article.text.contains("theme-aware-video")
    }
}

struct DefaultArticlePage: ArticlePage {
    
    var layout: MainLayout {
        MainLayout(deferredContent: {
            if ThemeAwareVideo.isIn(article) {
                ThemeAwareVideo.script
            }
        })
    }

    var body: some BodyElement {
        Section {
            tagsAndDate

            Text(article.title)
                .font(.title1)
                .lineSpacing(1.2)

            if let subtitle = article.subtitle {
                Text(subtitle)
                    .font(.pressStart2P)
                    .font(.lead)
            }

            if let image = article.imageHTML {
                image
                    .cornerRadius(20)
                    .margin([.top, .bottom], .medium)
                    .frame(width: .percent(100%))
            }

            Text(article.text)
            
            if let id = article.id {
                CusdisCommentsSection(id: id)
            }
        }
    }
    
    private var tagsAndDate: some HTML {
        HStack(alignment: .top) {
            ForEach(article.tags ?? []) { tag in
                ArticleTag(tag: tag)
            }
            Spacer()
            
            VStack(alignment: .trailing) {
                article.dateAndReadTimeHTML
                
                if article.isUpdated {
                    article.updateDateHTML
                }
            }
            .foregroundStyle(.gray)
        }
        .padding(.bottom, .large)
    }
}
