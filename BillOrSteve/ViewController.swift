//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var scoreCounter: UILabel!
    @IBOutlet weak var steveJobsButton: UIButton!
    @IBOutlet weak var billGatesButton: UIButton!
    
    @IBAction func steveButton(sender: AnyObject) {
        if person == "Steve Jobs" {
            counter += 1
            scoreCounter.text = String(counter)
        }
        showFact()
    }
    
    @IBAction func billButtonTapped(sender: AnyObject) {
        if person == "Bill Gates" {
          counter += 1
            scoreCounter.text = String(counter)
        }
        showFact()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createFacts()
        showFact()
    }
    
    func randomNumberFromZeroTo(number: Int) -> Int {
        return Int(arc4random_uniform(UInt32(number)))
    }
    
    func randomPerson() -> String {
        let randomNumber = arc4random_uniform(2)
        
        if randomNumber == 0 {
            return "Steve Jobs"
        } else {
            return "Bill Gates"
        }
    }
    
    // i have to make this a global var so that I can access it in other funcs
    var quiz = [String: Array<String>]()
    var person = String()
    var counter = 0

    
    func createFacts()  {
        
        let billGatesFacts = ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.", "He scored 1590 (out of 1600) on his SATs.", "His foundation spends more on global health each year than the United Nation's World Health Organization.", "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.", "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
        let steveJobsFacts = ["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.", "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.", "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.","He was a pescetarian, meaning he ate no meat except for fish."]
        
        quiz["Bill Gates"] = billGatesFacts
        quiz["Steve Jobs"] = steveJobsFacts
        
    }
    
    
    
    func getRandomFact() -> (fact: String, genius: String)? {
        
        // this gives me access to the key in my dictionary which in turn will give me acces to my values
        
        let genius = randomPerson()// "Bill Gates" or "Steve Jobs"
        // had to make this variable global to the function so I can use in the tuple that I returned
        
        var valueOfGenius = ""
        // the value/facts
        
        //facts = values
        let facts = quiz[genius]
        
        //if the value is not nil...
        if let arrayOfFacts = facts {
            
            //new constant that randomly selects the values using the randomNumber func
            valueOfGenius = arrayOfFacts[randomNumberFromZeroTo(arrayOfFacts.count)]
        }
        //return a tuple containing the values and keys
        return (valueOfGenius, genius)
        
    }
    
    func showFact()  {
        if let factAndPerson = getRandomFact() {
        // because the fact corresponds with the value, person needs to be assigned and declared
        person  = factAndPerson.1
            
        // provides the value/fact
        factLabel.text = factAndPerson.0
        }
        
    }
}


