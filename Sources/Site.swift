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
    var builtInIconsEnabled = true

    var author = "Tomasz Lizer"

    var homePage = Home()
    var layout = MainLayout()
}
