//
//  BookTableViewCell.swift
//  PoCha
//
//  Created by 向根 on 16/1/22.
//  Copyright © 2016年 向根. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var titleLabel: UILabel!
    //@IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //设置字体
        titleLabel.font = UIFont(name: "Wyue-GutiFangsong-NC", size: 26.0)
        commentLabel.font = UIFont(name: "Wyue-GutiFangsong-NC", size: 15.0)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
