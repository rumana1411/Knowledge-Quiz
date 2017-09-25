//
//  GKQ.swift
//  ReadingJASON
//
//  Created by Rumana Nazmul on 17/8/17.
//  Copyright © 2017 ALFA. All rights reserved.
//

import Foundation
class GKQ{
    
    var quesQ: String = ""
    var ansQ: String = ""
    var catg: String = ""
    var options = [String]()
    
    
    init(quesQ: String, ansQ: String, catg: String, options: [String]){
        
        self.quesQ = quesQ
        self.ansQ = ansQ
        self.catg = catg
        self.options = options as [String]
        
    }
}
