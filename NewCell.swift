//
//  NewCell.swift
//  ReadingJASON
//
//  Created by Rumana Nazmul on 23/8/17.
//  Copyright © 2017 ALFA. All rights reserved.
//

import UIKit

class NewCell: UITableViewCell {

       
    @IBOutlet weak var heightCons: NSLayoutConstraint!
    @IBOutlet weak var myImg: UIImageView!
    @IBOutlet weak var myLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var isExpanded:Bool = false
        {
        didSet
        {
            if !isExpanded {
                self.heightCons.constant = 0.0
                
            } else {
                self.heightCons.constant = 128.0
            }
        }
    }

}
