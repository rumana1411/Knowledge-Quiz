//
//  PopUpViewController.swift
//  ReadingJASON
//
//  Created by Rumana Nazmul on 21/8/17.
//  Copyright © 2017 ALFA. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

    @IBAction func settingsButton(_ sender: Any) {
        
        performSegue(withIdentifier: "goToSettings", sender: nil)
    }
    @IBAction func dismissButton(_ sender: UIButton) {
        
       dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // To Hide Status Bar
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
   }
