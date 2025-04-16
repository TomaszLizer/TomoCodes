//
//  Footer.swift
//  TomoCodes
//
//  Created by Tomasz Lizer on 22/04/2025.
//

import Ignite

struct Footer: HTML {
    
    var body: some HTML {
        VStack(alignment: .center, spacing: .medium) {
            SocialFooter()
            
            VStack(alignment: .center) {
                Text("Copyright © T.L. \(Date().year)")
                igniteFooter
            }
            .fixedSize()
        }
        .font(.body)
    }
    
    private var igniteFooter: some HTML {
        Text {
            "Created in Swift with "
            Link("Ignite", target: "https://github.com/twostraws/Ignite")
                .target(.newWindow)
                .relationship(.noOpener)
                .role(.none)
        }
    }
}
