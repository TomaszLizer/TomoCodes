import Foundation
import Ignite

struct MainLayout: Layout {
    var body: Document {
        Head {
            for favicon in Favicon.allCases {
                favicon.metalink()
            }
            MetaLink(href: "/css/typewriter-cursor.css", rel: .stylesheet)
            MetaTag.themeColor(.Background.primary, scheme: .light)
            MetaTag.themeColor(.Background.primary, scheme: .dark)
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
