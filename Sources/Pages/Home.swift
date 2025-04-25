import Foundation
import Ignite

struct Home: StaticPage {
    
    let title = "Home"
    
    var bio: String {
    """
    I'm a passionate Software Engineer with \(yearsOfExp) years of experience \
    specialising in iOS and Apple platforms. \
    My love for mobile tech started early — tinkering with gadgets was second nature. \
    Although I studied Nuclear Power Engineering, I eventually followed my true passion and dove \
    headfirst into iOS development. When I’m not writing Swift code, you’ll probably find me \
    pulling espresso shots, practicing latte art, or fixing something around the house — from \
    coffee machines to electronics. On this page, I’ll share thoughts on code, coffee, DIY projects, \
    and everything in between.
    """
    }
    
    var yearsOfExp: Int {
        return Date().year - 2018
    }
    
    @Environment(\.articles)
    private var articles
    
    var body: some HTML {
        
        Text(bio)
            .font(.body)
        
        ForEach(articles.all) { article in
            Link(article.title, target: article)
        }
    }
}
