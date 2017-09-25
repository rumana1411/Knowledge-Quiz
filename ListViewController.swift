//
//  ListViewController.swift
//  ReadingJASON
//
//  Created by Rumana Nazmul on 21/8/17.
//  Copyright © 2017 ALFA. All rights reserved.
//

import UIKit

//UIPopoverPresentationControllerDelegate for popOver
class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPopoverPresentationControllerDelegate{
    
   

    @IBAction func moreButton(_ sender: UIButton) {
        
        
    }
    
   
    @IBAction func backButton(_ sender: UIButton) {
        
    }
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       myTableView.delegate = self
       myTableView.dataSource = self
        
        splitData()
        
         print("world \(world.count)")
         print("animal \(animal.count)")
         print("solar \(solar.count)")
         print("foods \(foods.count)")
         print("human \(human.count)")
         print("arts \(arts.count)")
         print("movies \(movies.count)")
         print("plants \(plants.count)")
        
        
    }
    
    // To Hide Status Bar
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

   
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return category.count
    }
    
    
 
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
       
         var cell = myTableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CustomCell
        cell.myLbl?.text = category[indexPath.row]
        cell.myImgView.image = UIImage(named: imgArray[indexPath.row])
        cell.playLbl.tag = indexPath.row
        
        return cell
       
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("SEE \(indexPath.row)")
        performSegue(withIdentifier: "goToPlay", sender: indexPath)
    }
    
    
func splitData(){
    
    var k: Int = 0
        
        for eachItem in quizArray{
            
            if quizArray[k].catg == "World"{
              
                world.append(k)
                
           }
            else if quizArray[k].catg == "Animals & Birds"{
                
                animal.append(k)
               
                
            }
            else if quizArray[k].catg == "Human Body"{
                
                human.append(k)
                
            }
            if quizArray[k].catg == "Plants"{
                
                plants.append(k)
                
            }
            else if quizArray[k].catg == "Movies & Books"{
                
                movies.append(k)
                
                
            }
            else if quizArray[k].catg == "Arts"{
                
                arts.append(k)
                
            }
            else if quizArray[k].catg == "Music"{
                
                music.append(k)
                
                
            }
            else if quizArray[k].catg == "Solar System"{
                
                solar.append(k)
                
                
            }
            else if quizArray[k].catg == "Mathmatics"{
                
                math.append(k)
                
                
            }
            else if quizArray[k].catg == "Grammar"{
                
                grammar.append(k)
               
                
            }
            else if quizArray[k].catg == "Foods"{
                
                world.append(k)
                
                
            }
            k = k + 1

       }
 }
   
    // For PoPOver to avoid full screen load ****
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showPopOver"{
            
            let popOverVC = segue.destination as! PopUpViewController
            popOverVC.popoverPresentationController?.delegate = self
        }
        else if segue.identifier == "goToPlay" {
            
            let playVC = segue.destination as! QuizPlayViewController
            //the below line is incorrect and should be something else
            let selectedIndexPath = sender as! NSIndexPath
            let index = selectedIndexPath.row
            //pass data on using the index
            playVC.quizCat = index
            
        }
        
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle
    {
        return UIModalPresentationStyle.none
    }
//********************************

}
