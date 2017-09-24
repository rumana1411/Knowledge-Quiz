//
//  ViewController.swift
//  ReadingJASON
//
//  Created by Rumana Nazmul on 17/8/17.
//  Copyright © 2017 ALFA. All rights reserved.
//

//https://stackoverflow.com/questions/24410881/reading-in-a-json-file-using-swift by Ben
import UIKit

var quizArray = [GKQ]()
var world = [Int]()
var animal = [Int]()
var solar = [Int]()
var foods = [Int]()
var plants = [Int]()
var movies = [Int]()
var music = [Int]()
var human = [Int]()
var math = [Int]()
var grammar = [Int]()
var arts = [Int]()

var category = ["World","Animals & Birds","Human Body","Solar System","Mathmatics","Grammar","Foods","Music","Movies & Books","Arts","Plants"]
var imgArray = ["world.jpg","animal.jpeg","human.jpg","solar.jpg","math.jpeg","grammar.jpg","foods.jpg","music.jpg","movies.jpg","arts.jpg","plants.jpg"]

class ViewController: UIViewController {
    
    var fetchedData = [GKQ]()
    

    @IBOutlet weak var titleImgView: UIImageView!
    @IBOutlet weak var splashImgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Original working code
        
//        if let path = Bundle.main.path(forResource: "quiz", ofType: "json") {
//            do {
//                let jsonData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
//                do {
//                    let jsonResult: NSDictionary = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
//                    if let people : [NSDictionary] = jsonResult["Questions"] as? [NSDictionary] {
//                        for person: NSDictionary in people {
//                            for (name,value) in person {
//                                print("\(name) , \(value)")
//                            }
//                        }
//                    }
//                } catch {}
//            } catch {}
//        }
        
        
    //********************************************
    //Code for Reading a Jason file (quiz.jason)
    //*********************************************
        
    if let path = Bundle.main.path(forResource: "quiz", ofType: "json") {
        
        do {
            
            let jsonData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                
            do {
                    
                 //   let jsonResult: NSArray = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
                let jsonResult = try JSONSerialization.jsonObject(with: jsonData as Data, options: .mutableLeaves) as! NSDictionary
                    
                    
                    if let fetchedData: [NSDictionary] = jsonResult["Questions"]  as! [NSDictionary]{
                        
                        for eachFetchedCountry in fetchedData {
                            
                            let eachCountry = eachFetchedCountry as! [String: Any]
                            let Q = eachCountry["quesQ"] as! String
                            let Ans = eachCountry["ansQ"] as! String
                            let Catg = eachCountry["catg"] as! String
                            let options = eachCountry["options"] as! [String]
                            
                        //    print("Q: \(Q)  Ans: \(Ans) catg: \(Catg) options: \(options)")
                            
                            quizArray.append(GKQ(quesQ: Q, ansQ: Ans, catg: Catg, options: options as [String]))
                            
                        }  //for
                        
                     //   print(fetchedData.count)
                      //  print("QuizArray \(quizArray.count)")
                    }  //if
                   
            } catch {}  //do
        }  catch {}  //do
    
    } //if
        
        //Code of splash screen
        UIView.animate(withDuration: 4) {
            self.splashImgView.alpha = 1
            self.titleImgView.alpha = 1
        }
        
        perform(#selector(ViewController.showNavFunc), with: nil, afterDelay: 6)
        
    }  //ViewDidLoad

    
    func showNavFunc(){
        print("Ahsan")
        
        // performSegue(withIdentifier: "ShowNav", sender: nil)  //For Old menu
        performSegue(withIdentifier: "showNewNav", sender: nil)  //For New Menu
    }



} //ViewController
