//
//  ArticleTableViewCell.swift
//  Study_SwiftMVVM
//
//  Created by DaunJoung on 2021/08/08.
//

import UIKit

class ArticleTableViewCell:UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
