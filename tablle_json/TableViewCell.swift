//
//  TableViewCell.swift
//  tablle_json
//
//  Created by Tonya on 10/11/2018.
//  Copyright © 2018 Tonya. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

   
    @IBOutlet weak var imageforcell: UIImageView!
    
    @IBOutlet weak var labelforcell: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageforcell.layer.cornerRadius = imageforcell.frame.height / 2
        imageforcell.layer.masksToBounds = true
        imageforcell.layer.borderColor = UIColor.yellow.cgColor
        imageforcell.layer.borderWidth = 1
        labelforcell.lineBreakMode = .byWordWrapping
        labelforcell.numberOfLines = 0
    }
}
