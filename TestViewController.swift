//
//  TestViewController.swift
//  ReadingJASON
//
//  Created by Rumana Nazmul on 23/8/17.
//  Copyright © 2017 ALFA. All rights reserved.
//

import UIKit

class TestViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

          let imgs = ["0", "1", "2", "0", "1", "2", "0", "1", "2", "0", "1", "2", "0", "1", "2", "0", "1", "2", "0", "1", "2"]
        
        var expandedRows = Set<Int>()
        
    
    @IBOutlet weak var myTableView: UITableView!
        @IBOutlet weak var tableView: UITableView!
        
        override func viewDidLoad() {
            
            super.viewDidLoad()
            
            self.myTableView.delegate = self
            
            self.myTableView.dataSource = self
            
            self.myTableView.rowHeight = UITableViewAutomaticDimension
            
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 20
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:NewCell = tableView.dequeueReusableCell(withIdentifier: "newCell") as! NewCell
        
     //   cell.myImg.image = UIImage(named: imgs[indexPath.row])
        
        cell.isExpanded = self.expandedRows.contains(indexPath.row)
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 144.0
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(indexPath.row)
        
        guard let cell = myTableView.cellForRow(at: indexPath) as? NewCell
            
            else { return }
        
        
        
        switch cell.isExpanded
            
        {
            
        case true:
            
            self.expandedRows.remove(indexPath.row)
            
        case false:
            
            self.expandedRows.insert(indexPath.row)
            
        }
        
        
        
        cell.isExpanded = !cell.isExpanded
        
        
        
        self.myTableView.beginUpdates()
        
        self.myTableView.endUpdates()
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        guard let cell = myTableView.cellForRow(at: indexPath) as? NewCell
            
            else { return }
        
        self.expandedRows.remove(indexPath.row)
        
        
        cell.isExpanded = false
        
        self.myTableView.beginUpdates()
        
        self.myTableView.endUpdates()
        
    }


}
