import Foundation
import Ignite

@main
struct IgniteWebsite {
    static func main() async {
        var site = ExampleSite()

        do {
            try await site.publish()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct ExampleSite: Site {    
    var name = "TomoCodes"
    var titleSuffix = " – TomoCodes"
    var url = URL(static: "https://tomo.codes")
    /// Manually passed as custom component to HEAD
    var favicon: URL? = nil
    var builtInIconsEnabled = true

    var author = "Tomasz Lizer"
    
    var lightTheme: (any Theme)? = LightTheme()
    var darkTheme: (any Theme)? = DarkTheme()

    var homePage = Home()
    var layout = MainLayout()
}
