//
//  CusdisCommentsSection.swift
//  TomoCodes
//
//  Created by Tomasz Lizer on 10/05/2025.
//

import Ignite

struct CusdisCommentsSection: HTML {
    
    @Environment(\.page) private var page
    
    let id: String
    
    var body: some HTML {
        Section {
            Text("Comments")
                .font(.title1)
            
            cusdidContainer
            
            Script(file: URL(static: "/scripts/CusdisScript.js"))
        }
        .padding([.top, .bottom], .large)
    }
    
    @HTMLBuilder
    private var cusdidContainer: some HTML {
        """
        <div 
          hidden
          id="cusdis_thread"
          data-host="https://cusdis.com"
          data-app-id="cb59cfd6-8d96-40c3-93d8-42dc400a714b"
          data-page-id="\(id)"
          data-page-url="\(page.url)"
          data-page-title="\(page.title)"
        ></div>
        """
    }
}
