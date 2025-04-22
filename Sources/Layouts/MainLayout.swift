import Foundation
import Ignite

struct MainLayout: Layout {
    var body: some HTML {
        Head {
            for favicon in Favicon.allCases {
                favicon.metalink()
            }
        }
        Body {
            content
            
            Footer()
        }
    }
}
