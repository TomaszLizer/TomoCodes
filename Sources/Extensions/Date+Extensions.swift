//
//  Date+Extensions.swift
//  TomoCodes
//
//  Created by Tomasz Lizer on 24/04/2025.
//

import Foundation

extension Date {
    
    /// Returns year component based on gregorian calendar
    var year: Int {
        Calendar(identifier: .gregorian)
            .dateComponents([.year], from: self)
            .year!
    }
}
