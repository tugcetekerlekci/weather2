//
//  ViewController8.swift
//  SwiftWeather
//
//  Created by Ezgi Demirayak on 4/13/16.
//  Copyright © 2016 mApp. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController8: UIViewController {
    var player:AVAudioPlayer = AVAudioPlayer()
     var songs = ["Flo","Selena","DrDre","Kid","Whitney Houston - I Will Always Love You","Justin Timberlake - What Goes Around...Comes Around","The Cranberries - Zombie"]
    let alertController = UIAlertController(title: "Shake It", message:
        "To play a song or to change a song just shake your device!", preferredStyle: UIAlertControllerStyle.Alert)
    @IBAction func playSong(sender: AnyObject)
    {
       
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)

    }
   
    @IBAction func stopSong(sender: AnyObject)
        {
    
            
            
           // let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { action in}
            
           //  alertController.addAction(cancelAction)
            
           //  self.presentViewController(alertController, animated: true, completion: nil)
            
            player.pause()
    
    
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
      //shake function
        if event?.subtype == UIEventSubtype.MotionShake{
            
        //random song
            
            var randomNumber = Int(arc4random_uniform(UInt32(songs.count)))
            
            var fileLocation = NSBundle.mainBundle().pathForResource(songs[randomNumber], ofType: "mp3")
            
            
                       //var fileLocation = NSBundle.mainBundle().pathForResource("Flo", ofType: "mp3")
            var error: NSError? = nil
            do{
                
               
                try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: fileLocation!))
                
                player.play()
            }catch{
                
                
            }
            
            
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
