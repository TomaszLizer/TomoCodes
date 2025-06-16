//
//  HeroSection.swift
//  TomoCodes
//
//  Created by Tomasz Lizer on 28/04/2025.
//

import Ignite

struct HeroSection: HTML {
    
    static var requiredMeta: MetaLink {
        MetaLink(href: "/css/typewriter-cursor.css", rel: .stylesheet)
    }
    
    static var requiredScript: Script {
        Script(file: URL(static: "/scripts/typewriter.js"))
    }
        
    
    var title: String
    var subtitle: String
    /// List of strings that will be appended to subtitle with typewriter effect.
    var typewriterData: [String]?
    
    var body: some HTML {
        Section {
            Text(title)
                .font(.title1)
            
            Text{
                subtitle
                if let words = typewriterData {
                    let dataWords = words.joined(separator: ",")
                    Span()
                        .class("typing-text")
                        .attribute("data-words", dataWords)
                    Span("|")
                        .class("cursor")
                }
            }
            .font(.pressStart2P)
            .font(.lead)
        }
        .padding(.top, .small)
        .padding(.bottom, .large)
    }
}
