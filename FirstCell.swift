//
//  FirstCell.swift
//  ReadingJASON
//
//  Created by Rumana Nazmul on 25/8/17.
//  Copyright © 2017 ALFA. All rights reserved.
//

import UIKit

class FirstCell: UITableViewCell, UIPickerViewDataSource, UIPickerViewDelegate{

    @IBOutlet weak var firstLbl: UILabel!
    
    @IBOutlet weak var firstLblSelected: UILabel!
    @IBOutlet weak var firstPickerHeightCons: NSLayoutConstraint!
    @IBOutlet weak var firstPicker: UIPickerView!
    
    var pickerData = ["5","10","15","20"]
    var callback : ((String) -> ())?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        // RN
    
    
    firstPicker.delegate = self
    firstPicker.dataSource = self
}

override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
}


public func numberOfComponents(in pickerView: UIPickerView) -> Int{
    
    
    return 1
}



public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
    
    return pickerData.count
}


public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
    
    return pickerData[row]
}
    
//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//        
//        var label = view as! UILabel!
//        if label == nil {
//            label = UILabel()
//        }
//        
//        label?.font = UIFont(name: "Baskerville Bold", size: 14)!
//        label?.text =  pickerData[row] as? String
//        label?.textAlignment = .center
//        return label!
//        
//    }


    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        return callback!(pickerData[row])
    }

    
    
var isExpanded:Bool = false
        {
        didSet
        {
            if !isExpanded {
                self.firstPickerHeightCons.constant = 0.0
                
            } else {
                self.firstPickerHeightCons.constant = 128.0
            }
        }
    }

}
