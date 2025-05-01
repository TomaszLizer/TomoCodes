//
//  Social.swift
//  TomoCodes
//
//  Created by Tomasz Lizer on 22/04/2025.
//

import Ignite

@MainActor
enum Social: String, CaseIterable, Sendable, InlineElement {
    case github, linkedin, instagram
    
    var body: some InlineElement {
        Link(icon, target: urlString)
            .target(.newWindow)
            .relationship(.noOpener)
            .role(.primary)
            .margin(.small)
    }
    
    var icon: Image {
        Image(systemName: "\(rawValue)", description: iconDescription)
    }
    
    var iconDescription: String {
        switch self {
        case .github: "GitHub icon"
        case .linkedin: "LinkedIn icon"
        case .instagram: "Instagram icon"
        }
    }
    
    var urlString: String {
        switch self {
        case .github: "https://github.com/TomaszLizer"
        case .linkedin: "https://linkedin.com/in/tomasz-lizer-9b390bb4/"
        case .instagram: "https://instagram.com/engineer_pedi"
        }
    }
}
