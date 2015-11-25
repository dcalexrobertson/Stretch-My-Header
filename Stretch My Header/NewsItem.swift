//
//  NewsItem.swift
//  Stretch My Header
//
//  Created by Alex on 2015-11-24.
//  Copyright © 2015 Alex. All rights reserved.
//

import UIKit

enum Category: String {
    
    case World = "World", Americas = "Americas", Europe = "Europe", MiddleEast = "Middle East", Africa = "Africa", AsiaPacific = "Asia Pacific"
    func getColor() -> UIColor {
        switch self {
        case .World:
            return .redColor()
        case .Americas:
            return .blueColor()
        case .Europe:
            return .greenColor()
        case .MiddleEast:
            return .purpleColor()
        case .Africa:
            return .orangeColor()
        case .AsiaPacific:
            return .brownColor()
        }
    }
}

class NewsItem {
    
    var category: Category
    var headline: String
    
    init(category: Category, headline: String) {
        self.category = category
        self.headline = headline
    }
}
