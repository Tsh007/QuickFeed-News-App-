//
//  Category.swift
//  QuickFeed
//
//  Created by Tejash Singh on 24/04/24.
//

import Foundation

enum Category: String, CaseIterable{
    case general
    case business
    case technology
    case entertainment
    case sports
    case science
    case health
    
    var text: String{
        if self == .general{
            return "Headlines"
        }
        return rawValue.capitalized
    }
}

extension Category: Identifiable{
    var id: Self { self }
}
