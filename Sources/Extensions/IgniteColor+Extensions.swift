//
//  IgniteColor+Extensions.swift
//  TomoCodes
//
//  Created by Tomasz Lizer on 23/04/2025.
//

import Ignite
import SwiftUI

extension Ignite.Color {
    
    init(_ resource: ColorResource, scheme: Ignite.ColorScheme) {
        var env = EnvironmentValues()
        env.colorScheme = (scheme == .light) ? .light : .dark
        let color = SwiftUI.Color(resource).resolve(in: env)
        self.init(
            red: Double(color.red),
            green: Double(color.green),
            blue: Double(color.blue),
            opacity: Double(color.opacity)
        )
    }
}
