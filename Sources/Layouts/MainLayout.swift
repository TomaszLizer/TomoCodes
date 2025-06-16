import Foundation
import Ignite

struct MainLayout: Layout {
    typealias HeadElementBuilder = ElementBuilder<any HeadElement>
    typealias BodyElementBuilder = ElementBuilder<any BodyElement>
    
    var headContent: [any HeadElement]
    var deferredContent: [any BodyElement] = []
    
    /// - Parameters:
    ///   - headContent: Additional head content to be placed for page using this layout.
    ///   - deferredContent: Allows to add deferred content that should not be rendered immediately, such as scripts or additional HTML elements.
    init(
        @HeadElementBuilder headContent: () -> [any HeadElement] = { [] },
        @BodyElementBuilder deferredContent: () -> [any BodyElement] = { [] }
    ) {
        self.headContent = headContent()
        self.deferredContent = deferredContent()
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
            
            for item in deferredContent {
                item
            }
        }
        .padding(.top, .px(120))
        .padding(.bottom, .medium)
    }
}
