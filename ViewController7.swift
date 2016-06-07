//
//  ViewController7.swift
//  SwiftWeather
//
//  Created by Ezgi Demirayak on 4/10/16.

////  Copyright © 2016 mApp. All rights reserved.

import UIKit

class ViewController7: UIViewController {
    @IBOutlet weak var journal: UITextView!
    @IBAction func saveButton(sender: AnyObject) {
                //NSUserDefaults.standardUserDefaults().setObject("mApp", forKey:"name")
        //let userName=NSUserDefaults.standardUserDefaults().objectForKey("name")! as! String
        
      NSUserDefaults.standardUserDefaults().setObject(journal.text, forKey:"mApp")
        /*let prefs=NSUserDefaults.standardUserDefaults()
        
    
        prefs.setValue(journal, forKey: "mApp")*/
        let alertController = UIAlertController(title: "Save", message:
            "Your notebook has been saved successfully! Safe travels!", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
     
        view.addGestureRecognizer(tap)
        
        if NSUserDefaults.standardUserDefaults().objectForKey("mApp") != nil {
            
           
       journal.text=NSUserDefaults.standardUserDefaults().objectForKey("mApp")! as! String
        }
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
