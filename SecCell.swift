//
//  SecCell.swift
//  ReadingJASON
//
//  Created by Rumana Nazmul on 25/8/17.
//  Copyright © 2017 ALFA. All rights reserved.
//

import UIKit

class SecCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource {

    
    @IBOutlet weak var secLbl: UILabel!
    
    @IBOutlet weak var secLblSelected: UILabel!
    @IBOutlet weak var secPicker: UIPickerView!
    
    @IBOutlet weak var secPickerheightCons: NSLayoutConstraint!
    var pickerData = ["Ahsan","Rumana","Sabriyah"]
    var callback: ((String, Int)->())?
    
        override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
  

    secPicker.delegate = self
    secPicker.dataSource = self
}

override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
}


public func numberOfComponents(in pickerView: UIPickerView) -> Int{
    
    
    return 1
}



public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
    
    return category.count
}


public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
    
    return category[row]
}
    
//func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//        
//        var label = view as! UILabel!
//        if label == nil {
//            label = UILabel()
//        }
//        
//        label?.font = UIFont(name: "Baskerville Bold", size: 14)!
//        label?.text =  category[row] as? String
//        label?.textAlignment = .center
//        return label!
//        
//    }



    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        return callback!(category[row], row)
    }


var isExpanded:Bool = false
        {
        didSet
        {
            if !isExpanded {
                self.secPickerheightCons.constant = 0.0
                
            } else {
                self.secPickerheightCons.constant = 128.0
            }
        }
    }

}
