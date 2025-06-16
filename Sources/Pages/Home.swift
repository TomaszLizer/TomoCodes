import Foundation
import Ignite

struct Home: StaticPage {
    
    let title = "Home"
    let layout = MainLayout {
        HeroSection.requiredMeta
    }
    
    @Environment(\.articles)
    private var articles
    
    var body: some HTML {
        HeroSection(
            title: "Coffee, Code & DIY",
            subtitle: "Thoughts on ",
            typewriterData: ["Hacking", "Espresso", "Projects", "Tinkering"]
        )
        
        aboutMe
        
        latestPost
    }
    
    private var aboutMe: some HTML {
        Section {
            Image("/media/PixAvatar.webp", description: "Pixelated avatar of me")
                .resizable()
                .frame(width: 100)
                .class("float-start", "rounded-circle")
                .border(.black, width: 2)
                .class("bg-body-secondary")
                .margin(.trailing, .medium)
                .margin(.bottom, .small)
            
            Text("About me")
                .font(.title2)
            Text {
                "Hi, I'm "
                Strong("Tomasz")
                " — but friends call me "
                Strong("Tomo.")
                "<br>"
                """
                A passionate Software Engineer with \(Date.yearsOfExp) years of experience. \
                I specialize in Apple platforms, especially iOS. \
                My love for mobile tech started early — \
                tinkering with gadgets was second nature. \
                Though I studied Nuclear Power Engineering, \
                I eventually followed my true passion and dove \
                headfirst into iOS development.
                """
            }
            Text {
                """
                When I’m not writing Swift code, you’ll likely find \
                me pulling espresso shots, practicing latte art, \
                or fixing something around the house — \
                from coffee machines to electronics.
                """
            }
            Text {
                """
                Welcome to my corner where code, coffee, \
                and creativity come together!
                """
            }
        }
    }
    
    private var latestPost: some HTML {
        Section {
            Text("Latest posts").font(.title2)
            let latestPosts = articles.typed(.blog)
            PostsGrid(articles: latestPosts)
        }
        .padding(.vertical, .large)
    }
}

