//
//  QuizPlayViewController.swift
//  ReadingJASON
//
//  Created by Rumana Nazmul on 22/8/17.
//  Copyright © 2017 ALFA. All rights reserved.
//

import UIKit




class QuizPlayViewController: UIViewController {

    var setTask = 5
    var quizCat = -1
    
    var total = -1
    var cntQ = 0
    var rightPos = 0
    var testScore = 0
    var headerLabel = UILabel()
    var qLabel = UILabel()
    var ansLabel = UILabel()
    var msgLabel = UILabel()
    var myQ: String = ""
    var myAns: String = ""
    var myOptions = [String]()
    var buttonFlag: Bool!
    var optionButtons = [UIButton]()
    var nextbtn = UIButton()
    
    
    
    @IBAction func backButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "goBackToMenu", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("QuizCat: \(quizCat) \(category[quizCat])")
        
        nextbtn.isHidden = true
        createNextButton()
        newQues()
        
        
        
        
        
    }
    
    func createRndQ(){
      
        var theRandomNumber: Int!
        myOptions.removeAll()
        
        var indexQ: Int!
        
        if quizCat == 0{
            
            total = world.count
            theRandomNumber = (Int(arc4random_uniform(UInt32(total))))
            print(theRandomNumber)
            indexQ = world[theRandomNumber]
            print(world[theRandomNumber])
          
        }
        else if quizCat == 1{
            
            total = animal.count
            theRandomNumber = (Int(arc4random_uniform(UInt32(total))))
            print(animal[theRandomNumber])
            indexQ = animal[theRandomNumber]
            
        }
        else if quizCat == 2{
            
            total = human.count
            theRandomNumber = (Int(arc4random_uniform(UInt32(total))))
            print(human[theRandomNumber])
            indexQ = human[theRandomNumber]
            
        }
        else if quizCat == 3{
            
            total = solar.count
            theRandomNumber = (Int(arc4random_uniform(UInt32(total))))
            print(solar[theRandomNumber])
            indexQ = solar[theRandomNumber]
            
        }
        else if quizCat == 4{
            
            total = math.count
            theRandomNumber = (Int(arc4random_uniform(UInt32(total))))
            print(math[theRandomNumber])
            indexQ = math[theRandomNumber]
            
            
        }
        else if quizCat == 5{
            
            total = grammar.count
            theRandomNumber = (Int(arc4random_uniform(UInt32(total))))
            print(grammar[theRandomNumber])
            indexQ = grammar[theRandomNumber]
            
        }
        else if quizCat == 6{
            
            total = foods.count
            theRandomNumber = (Int(arc4random_uniform(UInt32(total))))
            print(foods[theRandomNumber])
            indexQ = foods[theRandomNumber]
            
        }
        else if quizCat == 7{
            
            total = music.count
            theRandomNumber = (Int(arc4random_uniform(UInt32(total))))
            print(music[theRandomNumber])
            indexQ = music[theRandomNumber]
            
        }
        if quizCat == 8{
            
            total = movies.count
            theRandomNumber = (Int(arc4random_uniform(UInt32(total))))
            print(movies[theRandomNumber])
            indexQ = movies[theRandomNumber]
            
        }
        
        if quizCat == 9{
            
            total = arts.count
            theRandomNumber = (Int(arc4random_uniform(UInt32(total))))
            print(arts[theRandomNumber])
            indexQ = arts[theRandomNumber]
           
            
        }
        
        if quizCat == 10{
            
            total = plants.count
            theRandomNumber = (Int(arc4random_uniform(UInt32(total))))
            print(plants[theRandomNumber])
            indexQ = plants[theRandomNumber]
            
        }
        
        
      
        myQ = quizArray[indexQ].quesQ
        myAns = quizArray[indexQ].ansQ
        for i in 0...2{
        
            myOptions.append(quizArray[indexQ].options[i])
        }
       
        print(myQ)
        print("TOTAL\(total)")
        
       
        

        
    }
    
    
    func createUIView(){
        
        
        let myView = UIView()
        myView.frame = CGRect(x: 300, y: 300, width: 200, height: 30)
        myView.backgroundColor = UIColor.brown
        myView.layer.borderWidth = 4
        myView.layer.borderColor = UIColor(red:244/255.0, green:225/255.0, blue:227/255.0, alpha: 1.0).cgColor
        
        view.addSubview(myView)
        
    }
    
    
    
    func createHeaderLbl()->UILabel{
        print("Head ")
        //Creating header Label
        let headerLabel = UILabel()
        headerLabel.frame = CGRect(x: 100, y: 80, width: 200, height: 50)   //setting frame
        headerLabel.layer.borderWidth = 3.0
        headerLabel.layer.borderColor = UIColor(red:130/255.0, green:75/255.0, blue:250/255.0, alpha: 1.0).cgColor
        headerLabel.backgroundColor = UIColor.lightGray//setting backgroundColor
        headerLabel.textColor = UIColor.white     //setting text color
        headerLabel.textAlignment = NSTextAlignment.center//setting alignment of text to left in label
        headerLabel.text = "Your question no." + String(cntQ)           //writing text on the label
        
        return headerLabel
        
        
    }
    
    func createQuesLbl()->UILabel{
        
        //   Creating Question Label
        let qLabel = UILabel()               //declaring variable of label type
        qLabel.layer.borderWidth = 3.0
        qLabel.layer.borderColor = UIColor(red:130/255.0, green:75/255.0, blue:250/255.0, alpha: 1.0).cgColor
        qLabel.frame = CGRect(x: 13, y: 150, width: 380, height: 60)   //setting frame
        qLabel.backgroundColor = UIColor(red:130/255.0, green:45/255.0, blue:254/255.0, alpha: 0.5)
//setting backgroundColor
        qLabel.textColor = UIColor.white      //setting text color
        qLabel.textAlignment = NSTextAlignment.center//setting alignment of text to left in label
        qLabel.lineBreakMode = .byWordWrapping // or NSLineBreakMode.ByWordWrapping
        qLabel.numberOfLines = 0
        qLabel.text = myQ
        
        return qLabel
        
    }
    
    func createButton(i: Int, xVal: Int, yVal: Int, rightPos: Int, k: Int){
        
        let btn = UIButton(type: UIButtonType.custom) as UIButton
        btn.backgroundColor = UIColor(red:130/255.0, green:75/255.0, blue:254/255.0, alpha: 0.75)
        btn.frame = CGRect(x: xVal, y: yVal, width: 200, height: 40)
        btn.layer.borderWidth = 3.0
        btn.layer.borderColor = UIColor(red:130/255.0, green:75/255.0, blue:250/255.0, alpha: 1.0).cgColor
        btn.setTitleColor(UIColor(red: 0.9, green: 0.4, blue: 0.7, alpha: 1), for: UIControlState.normal)
        btn.tag = i
        
        
        
        if btn.tag == rightPos{
            btn.setTitle("", for: UIControlState.normal)
            btn.setTitle(myAns, for: UIControlState.normal)
            buttonFlag = true
        }
        else{
            
            //   if k != pos{
            //     btn.setTitle(ans[qRnd][k], for: UIControlState.normal)
            //       k = k+1
            //
            //           }
            //    else{
            //
            //        k = k+1
            //        btn.setTitle(ans[qRnd][k], for: UIControlState.normal)
            //        k = k+1
            //           }
            
            btn.setTitle("", for: UIControlState.normal)
            btn.setTitle(myOptions[k], for: .normal)
            print("Option \(k) is \(myOptions[k])")
            
        }
        
        btn.addTarget(self,action:#selector(buttonClicked),for:.touchUpInside)
        self.view.addSubview(btn)
        optionButtons.append(btn)
        if k == 2 {
            
          for btn in self.optionButtons{
            
            btn.isEnabled = true
            
          }
        }
        
       
        
        
    }
    
    
    func buttonClicked(sender:UIButton)
    {
        for btn in optionButtons{
            
            btn.isEnabled = false
            
        }
        //let ansLabel = UILabel()
    //    var nextbutton = UIButton()
        ansLabel.isHidden = false
        //declaring variable of label type
        ansLabel.frame = CGRect(x: 100, y: 450, width: 200, height: 40)   //setting frame
        ansLabel.layer.borderWidth = 3.0
        ansLabel.layer.borderColor = UIColor(red:130/255.0, green:75/255.0, blue:255/255.0, alpha: 1.0).cgColor
        ansLabel.backgroundColor = UIColor(red:130/255.0, green:75/255.0, blue:254/255.0, alpha: 0.75)
//setting backgroundColor
        ansLabel.textColor = UIColor.black      //setting text color
        ansLabel.textAlignment = NSTextAlignment.center//setting alignment of text to left in label
        
        
        if sender.tag == rightPos{
            ansLabel.text = "Your Answer is Right."   //writing text on the label
            self.view.addSubview(ansLabel)
            testScore = testScore + 1
        }else{
            ansLabel.text = "Your Answer is Wrong."   //writing text on the label
            self.view.addSubview(ansLabel)
        }
        
        if cntQ >= setTask{
            msgLabel = createMsgLbl()
            self.view.addSubview(msgLabel)
            
            
        }else{
            nextbtn.isHidden = false
       //     nextbutton = createNextButton()
       //     self.view.addSubview(nextbutton)
        }
        
        
    }
    
 //   func createNextButton()-> UIButton{
    func createNextButton(){
     //   var nextbtn = UIButton()
       
        optionButtons.removeAll()
        nextbtn.backgroundColor = UIColor(red:130/255.0, green:75/255.0, blue:254/255.0, alpha: 0.75)

        nextbtn.layer.borderWidth = 3.0
        nextbtn.layer.borderColor = UIColor(red:130/255.0, green:75/255.0, blue:250/255.0, alpha: 1.0).cgColor
        nextbtn.frame = CGRect(x: 100, y: 500, width: 200, height: 40)
        nextbtn.setTitleColor(UIColor(red: 0.9, green: 0.4, blue: 0.7, alpha: 1), for: UIControlState.normal)
        nextbtn.tag = 100
        nextbtn.setTitle("Next Question", for: UIControlState.normal)
        nextbtn.addTarget(self,action:#selector(newQues),for:.touchUpInside)
        view.addSubview(nextbtn)
    
    //    return nextbtn
        
    }
    

    
    func createMsgLbl()-> UILabel{
        
        let msgLabel = UILabel()               //declaring variable of label type
        msgLabel.layer.borderWidth = 3.0
        msgLabel.layer.borderColor = UIColor(red:130/255.0, green:75/255.0, blue:250/255.0, alpha: 1.0).cgColor
        msgLabel.frame = CGRect(x: 80, y: 500, width: 250, height: 40)   //setting frame
        msgLabel.backgroundColor = UIColor(red:130/255.0, green:75/255.0, blue:254/255.0, alpha: 0.45)
//setting backgroundColor
        msgLabel.textColor = UIColor.black      //setting text color
        msgLabel.textAlignment = NSTextAlignment.center//setting alignment of text to left in label
        msgLabel.text = "Test Finished. Your Score:" + String(testScore)              //writing text on the label
        
        return msgLabel
    }


    func newQues(){
        
            
            
            cntQ = cntQ + 1
            print("CntQ \(cntQ)")
            
            qLabel.text = ""
            ansLabel.isHidden = true
            nextbtn.isHidden = true
        
            
            headerLabel = createHeaderLbl()
            self.view.addSubview(headerLabel)
            
            createRndQ()
            
            
            qLabel = createQuesLbl()
            self.view.addSubview(qLabel)
        
     //   createUIView()
        
        var xVal:Int = 100
        var yVal:Int = 230
        var k = 0
        rightPos = (Int(arc4random_uniform(UInt32(4))))
        
        
        for i in 0...3{
            
            buttonFlag = false
            createButton(i: i, xVal: xVal, yVal: yVal, rightPos: rightPos, k: k)
            if buttonFlag == false{
                k = k + 1
                
            }
            xVal = 100
            yVal = yVal + 50
            
        } //for

    }
    
    

}
