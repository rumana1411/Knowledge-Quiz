//
//  CustomCell.swift
//  ReadingJASON
//
//  Created by Rumana Nazmul on 21/8/17.
//  Copyright © 2017 ALFA. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var myImgView: UIImageView!
    
    @IBOutlet weak var myLbl: UILabel!
    
    @IBOutlet weak var playLbl: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
