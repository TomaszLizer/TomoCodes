import Foundation
import Ignite

struct MainLayout: Layout {
    typealias HeadElementBuilder = ElementBuilder<any HeadElement>
    
    /// Additional head content to be placed for page using this layout
    var headContent: [any HeadElement]
    
    init(@HeadElementBuilder headContent: () -> [any HeadElement] = { [] }) {
        self.headContent = headContent()
    }
    
    var body: some Document {
        Head {
            for favicon in Favicon.allCases {
                favicon.metalink()
            }
            MetaTag.themeColor(.Background.primary, scheme: .light)
            MetaTag.themeColor(.Background.primary, scheme: .dark)
            Analytics(.goatCounter("tomo"))
            for item in headContent{
                item
            }
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
