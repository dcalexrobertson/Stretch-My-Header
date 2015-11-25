//
//  NewsTableViewCell.swift
//  Stretch My Header
//
//  Created by Alex on 2015-11-24.
//  Copyright © 2015 Alex. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    // MARK: Properties
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var headlineLabel: UILabel!
    
    var newsItem: NewsItem? {
        
        didSet {
            
            if let item = newsItem {
                
                categoryLabel.text = item.category.rawValue
                categoryLabel.textColor = item.category.getColor()
                headlineLabel.text = item.headline
                
            } else {
                
                categoryLabel.text = nil
                headlineLabel.text = nil
            }
        }
        
    }
}