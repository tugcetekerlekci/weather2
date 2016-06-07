//
//  ViewController4.swift
//  SwiftWeather
//
//  Created by Ezgi Demirayak on 4/10/16.
//  Copyright © 2016 mApp. All rights reserved.
//

import UIKit

class ViewController4: UIViewController {

    @IBOutlet weak var webView1: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url1="https://en.wikipedia.org/wiki/"+input
        let url = NSURL(string: url1)!
        // (string: url) = url + "?g=&s=" + input
        
        webView1.loadRequest(NSURLRequest(URL: url))
        // Do any additional setup after loading the view.
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
