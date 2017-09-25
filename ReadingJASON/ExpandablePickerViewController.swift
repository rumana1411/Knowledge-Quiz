//
//  ExpandablePickerViewController.swift
//  ReadingJASON
//
//  Created by Rumana Nazmul on 25/8/17.
//  Copyright © 2017 ALFA. All rights reserved.
//

import UIKit

var selectedQ: Int!
var selectedCat: String!
var selectedCatIndex: Int!

class ExpandablePickerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    
    @IBAction func playButton(_ sender: Any) {
        
        performSegue(withIdentifier: "goToPlay", sender: nil)
        
    }
    @IBAction func goBackButton(_ sender: Any) {
        
        performSegue(withIdentifier: "goBack", sender: nil)
    }
    
    @IBOutlet weak var myTableView: UITableView!
    var expandedRows = Set<Int>()
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    

    myTableView.delegate = self
    myTableView.dataSource = self
    
    myTableView.estimatedRowHeight = 44
    myTableView.rowHeight = UITableViewAutomaticDimension
        
        selectedQ = 5
        selectedCatIndex = 0
}




public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
    
    return 2
}


// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)


public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
    
     var cell = myTableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath)
    
    if indexPath.row == 0{
        
       var cell = myTableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath) as! FirstCell
        cell.firstLbl?.text = "Tap Here"
        cell.callback = { (value) in
            
            selectedQ = Int(value)
            cell.firstLblSelected.text = value
            
        }
        cell.isExpanded = self.expandedRows.contains(indexPath.row)

        return cell
    }
    else if indexPath.row == 1{
        
      var  cell = myTableView.dequeueReusableCell(withIdentifier: "secCell", for: indexPath) as! SecCell
      cell.secLbl.text = "Tap Here"
      cell.callback = { (value, valIndex) in
            
        selectedCat = value
        selectedCatIndex = valIndex
        cell.secLblSelected.text = value
            
     }
     
      cell.isExpanded = self.expandedRows.contains(indexPath.row)

        return cell
    }
        
    return cell
    
    
}

//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        
//        return 144.0
//        
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(indexPath.row)
      
       
        if indexPath.row == 0{
            
          guard let cell = myTableView.cellForRow(at: indexPath) as? FirstCell
            
            else { return }
            
            switch cell.isExpanded
                
            {
                
              case true:
                
                  self.expandedRows.remove(indexPath.row)
                
              case false:
                
                  self.expandedRows.insert(indexPath.row)
                
            }
            
            
            
            cell.isExpanded = !cell.isExpanded
            
            
            
           
        }
        
        else if indexPath.row == 1{
            
            guard let cell = myTableView.cellForRow(at: indexPath) as? SecCell
                
                else { return }
            
            
            switch cell.isExpanded
                
            {
                
            case true:
                
                self.expandedRows.remove(indexPath.row)
                
            case false:
                
                self.expandedRows.insert(indexPath.row)
                
            }
            
            cell.isExpanded = !cell.isExpanded
            
            
            
        }
        
        self.myTableView.beginUpdates()
        
        self.myTableView.endUpdates()
        
       
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0{
          guard let cell = myTableView.cellForRow(at: indexPath) as? FirstCell
            
            else { return }
        
          self.expandedRows.remove(indexPath.row)
        
        
         cell.isExpanded = false
            
        }
        
        else if indexPath.row == 1{
            guard let cell = myTableView.cellForRow(at: indexPath) as? SecCell
                
                else { return }
            
            self.expandedRows.remove(indexPath.row)
            
            
            cell.isExpanded = false
            
        }
        
        self.myTableView.beginUpdates()
        
        self.myTableView.endUpdates()
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToPlay"{
          
            let destVC =   segue.destination as! QuizPlayViewController
            destVC.setTask = selectedQ
            destVC.quizCat = selectedCatIndex
            
       }
    }
    
}
