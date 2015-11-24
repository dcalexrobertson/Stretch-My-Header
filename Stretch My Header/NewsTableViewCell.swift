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
    
    var category: String?
    var headline: String?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
