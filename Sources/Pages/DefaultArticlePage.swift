//
//  DefaultArticlePage.swift
//  TomoCodes
//
//  Created by Tomasz Lizer on 09/05/2025.
//

import Ignite

struct DefaultArticlePage: ArticlePage {
    
    let layout = MainLayout()
    
    var body: some BodyElement {
        Section {
            tagsAndDate

            Text(article.title)
                .font(.title1)
                .lineSpacing(1.2)

            if let subtitle = article.subtitle {
                Text(subtitle)
                    .font(.title5)
            }

            if let image = article.imageHTML {
                image
                    .cornerRadius(20)
                    .margin([.top, .bottom], .medium)
            }

            Text(article.text)
            
            if let id = article.id {
                CusdisCommentsSection(id: id)
            }
            
            Script(file: "/scripts/theme-aware-video.js")
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
