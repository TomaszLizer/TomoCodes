//
//  SocialFooter.swift
//  TomoCodes
//
//  Created by Tomasz Lizer on 22/04/2025.
//

import Ignite

struct SocialFooter: HTML {

    var body: some HTML {
        Text {
            for item in Social.allCases {
                item
            }
        }
        .margin(.zero)
        .font(.title1)
    }
}
