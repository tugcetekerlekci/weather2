//
//  ViewController5.swift
//  SwiftWeather
//
//  Copyright © 2016 mApp. All rights reserved.
//  Created by Ezgi Demirayak on 3/30/16.


import UIKit
var input=" "
class ViewController5: UIViewController {
    
@IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ShowWeather(sender: AnyObject) {
        input = textField.text!
        
    }
    
    @IBAction func genInfo(sender: AnyObject) {
        input = textField.text!
        //jsonfunc()
        
        
    }
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
   /* func jsonfunc()
    {
       
    
        let input1=input.stringByReplacingOccurrencesOfString(" ", withString: "")
        print(input1)
         let u="http://api.openweathermap.org/data/2.5/forecast q="+String(input1)+"&appid=a982be2caabc317d1bb1d17c4724380b"
        
        
        let url = NSURL(string: u)!
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
            
            if let urlContent = data {
                
                do {
                    
                    let jsonResult = try NSJSONSerialization.JSONObjectWithData(urlContent, options: NSJSONReadingOptions.MutableContainers)
             
                 
                    
                } catch {
                    
                    print("JSON serialization failed")
                    
                }
                
                
            }
            
            
        }
        
        task.resume()
    }*/
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


