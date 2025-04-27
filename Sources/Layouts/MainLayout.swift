import Foundation
import Ignite

struct MainLayout: Layout {
    var body: Document {
        Head {
            for favicon in Favicon.allCases {
                favicon.metalink()
            }
            MetaLink(href: "/css/typewriter-cursor.css", rel: .stylesheet)
        }
        Body {
            LogoNavBar()
            
            content
            
            Footer()
        }
        .padding(.top, .px(120))
        .padding(.bottom, .medium)
    }
}
