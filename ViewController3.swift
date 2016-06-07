//
//  ViewController3.swift
//  SwiftWeather
//
//  Created by Ezgi Demirayak on 3/30/16.
//  Copyright © 2016 mApp. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

var latitude:CLLocationDegrees = latit

var  longitude:CLLocationDegrees = longit

class ViewController3: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate {
    
    var manager:CLLocationManager!
    @IBOutlet weak var map: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()

        
        let  latDelta:CLLocationDegrees = 0.05
        
        let  lonDelta:CLLocationDegrees = 0.05
        
        let  span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        let  location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let  region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        map.setRegion(region, animated: false)
        
        let  annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        
        
        annotation.title = "Here you are!"
        
        map.addAnnotation(annotation)
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
