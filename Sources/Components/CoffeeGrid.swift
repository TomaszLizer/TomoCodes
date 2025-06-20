//
//  CoffeeGrid.swift
//  TomoCodes
//
//  Created by Tomasz Lizer on 20/06/2025.
//

import Ignite

@MainActor
struct CoffeeItem {
    let thumbnail: String
    let imageDescription: String
    let title: String
    let subtitle: String
}

extension CoffeeItem {
    var thumbnailImage: Image {
        Image(thumbnail, description: imageDescription)
    }
}

extension CoffeeItem {
    static var everydayStarter: Self {
        .init(
            thumbnail: thumbnail(for: "everyday-starter"),
            imageDescription: "Coffee mug with a brown coffee",
            title: "Everyday starter",
            subtitle: "Flat white on double ristretto to keeps thing rolling."
        )
    }
    
    static func thumbnail(for name: String) -> String {
        "/media/coffee/\(name)/thumbnail.webp"
    }
}

@MainActor
extension Array where Element == CoffeeItem {
    static var allItems: [Element] {
        [.everydayStarter]
    }
}

struct CoffeeGrid: HTML {
    
    var coffees: [CoffeeItem]
    
    var body: some HTML {
        Grid(alignment: .leading) {
            ForEach(coffees) { coffee in
                VStack(alignment: .leading) {
                    coffee.thumbnailImage
                        .resizable()
                        .aspectRatio(.r4x3, contentMode: .fill)
                    VStack(alignment: .leading) {
                        Text(coffee.title)
                            .font(.title3)
                        Text(coffee.subtitle)
                            .font(.body)
                    }
                    .padding(.small)
                }
                .width(4)
                .class("bg-body-secondary")
                .border(.dimGray)
                .cornerRadius(15)
                .clipped()
            }
        }
    }
}
