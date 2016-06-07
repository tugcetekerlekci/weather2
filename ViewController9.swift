//
//  ViewController9.swift
//  SwiftWeather
//
//  Created by Ezgi Demirayak on 4/14/16.
//  Copyright © 2016 mApp. All rights reserved.
//

import UIKit

class ViewController9: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblCountry: UILabel!
    @IBOutlet weak var lblScore: UILabel!
    var score=1
    var input=""

    @IBAction func btnGuess(sender: AnyObject) {
        input=textField.text!
        if(input != "")
        {
        guessCapital()
            
        }
     
        
    }
    var capitals=[]
     var countries=[]
         var randomNumber=0
    @IBAction func nextQuestion(sender: AnyObject) {
    
        if(score>0)
        {
             setcountry()
            //guessCapital()
        }
        if(score==0)
        {
            let alertController = UIAlertController(title: "Guess the Capital", message:
                "GAME OVER TRAVELER!", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            score=1
            [self.viewDidLoad]
        }
   
    }
  
    override func viewDidLoad() {
        countries=["France","Turkey","United States"]
           countries=["Albania",
            "Andorra",
            "Armenia",
            "Austria",
            "Azerbaijan",
            "Belarus",
            "Belgium",
            "Bosnia Hezergovina",
            "Bulgaria",
            "Croatia",
            "Cyprus",
            "Czech Republic",
            "Denmark",
            "Estonia",
            "Finland",
            "France",
            "Georgia",
            "Germany",
            "Greece",
            "Hungary",
            "Iceland",
            "Ireland",
            "Italy",
            "Kazakhstan",
            "Latvia",
            "Liechstein",
            "Lithuania",
            "Luxembourg",
            "Macedonia",
            "Malta",
            "Moldova",
            "Monaco",
            "Montenegro",
            "Netherldands",
            "Norway",
            "Poland",
            "Portugal",
            "Romania",
            "Russia",
            "San Marino",
            "Serbia",
            "Slovakia",
            "Slovenia",
            "Spain",
            "Sweden",
            "Switzerland",
            "Turkey",
            "Ukraine",
            "United Kingdom",
            "Vatican City",
            "Aland",
            "Akrotiri & Dhekelia",
            "Faroe Islands",
            "Gibraltar",
            "Guernsey",
            "Isle of man",
            "Jersey",
            "Abkhazia",
            "Kosovo",
            "Northern Cyprus",
            "South Ossetia",
            "Nagorno Karabakh",
            "Transnistria"]
        
       
           capitals=["Tirana",
            "Andorra la Vella",
            "Yerevan",
            "Vienna",
            "Baku",
            "Minsk",
            "Brussels",
            "Sarajevo",
            "Sofia",
            "Zagreb",
            "Nicosia",
            "Prague",
            "Copenhagen",
            "Tallinn",
            "Helsinki",
            "Paris",
            "Tbilisi",
            "Berlin",
            "Athens",
            "Budapest",
            "Reykjavik",
            "Dublin",
            "Rome",
            "Astana",
            "Riga",
            "Vaduz",
            "Vilnius",
            "Luxembourg City",
            "Skopje",
            "Valletta",
            "Chisinau",
            "Monaco",
            "Podgorica",
            "Amsterdam",
            "Oslo",
            "Warsaw",
            "Lisbon",
            "Bucharest",
            "Moscow",
            "City of San Marino",
            "Belgrade",
            "Bratislava",
            "Ljubljana",
            "Madrid",
            "Stockholm",
            "Bern",
            "Ankara",
            "Kiev",
            "London",
            "Vatican City",
            "Mariehamn",
            "Episkopi Cantonment",
            "Torshvan",
            "Gibraltar",
            "St.Peter Port",
            "Douglas",
            "St.Helier",
            "Sukhumi",
            "Pristina",
            "Lefkosa",
            "Tskhinvali",
            "Stepanakert",
            "Tiraspol"]
 
        
        setcountry()
        lblScore.text=(String)(score)
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
       

        // Do any additional setup after loading the view.
    }
    func setcountry ()
    {
       
      
        randomNumber = Int(arc4random_uniform(UInt32(countries.count)))
        
        lblCountry.text=countries[randomNumber] as! String
    }
    func guessCapital(){
        if(input==capitals[randomNumber] as! String)
        {
            lblStatus.text="Correct Answer!"
            lblStatus.textColor=UIColor.greenColor()
           
                score=score+1
            
          
            textField.text=""
            
        }
        else
        {
            lblStatus.text="Wrong Answer!"
            lblStatus.textColor=UIColor.redColor()
            if(score>0)
            {
                score=score-1
            }
            textField.text=""
        }
        
        lblScore.text=String(score)
    }
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
