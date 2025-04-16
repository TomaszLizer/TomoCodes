//
//  SocialFooter.swift
//  TomoCodes
//
//  Created by Tomasz Lizer on 22/04/2025.
//

import Ignite

struct SocialFooter: InlineElement {

    var body: some HTML {
        Text {
            ForEach(Social.allCases) { $0 }
        }
        .margin(.zero)
        .font(.title1)
    }
}
