
//  Created by Ezgi Demirayak on 3/29/16.

//  Copyright © 2016 mApp. All rights reserved.

//mApp ios Application

import UIKit
import CoreLocation
import MapKit




class ViewController: UIViewController, CLLocationManagerDelegate,  MKMapViewDelegate  {
    
    var manager:CLLocationManager!
    
    var latitude:CLLocationDegrees = 42.0891413093459
    
    var  longitude:CLLocationDegrees = -75.9684558838623

    @IBOutlet var map: MKMapView!
    @IBOutlet var addressLabel: UILabel!
    
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
        
        let uilpgr = UILongPressGestureRecognizer(target: self, action: "action:")
        
        uilpgr.minimumPressDuration = 2
        
        map.addGestureRecognizer(uilpgr)
        
        
    }
    func action(gestureRecognizer: UIGestureRecognizer) {
        
        print("Gesture Recognized")
        
        let touchPoint = gestureRecognizer.locationInView(self.map)
        
        let newCoordinate: CLLocationCoordinate2D = map.convertPoint(touchPoint, toCoordinateFromView: self.map)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = newCoordinate
        
        annotation.title = "New Place"
        
        annotation.subtitle = "One day I'll go here..."
        
        map.addAnnotation(annotation)
        
        
        
    }
    //NOTE: [AnyObject] changed to [CLLocation]
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]  ) {
        
        print(locations)
        
        //userLocation - there is no need for casting, because we are now using CLLocation object
        
        let userLocation:CLLocation = locations[0]
        
        latitude = (CLLocationDegrees)("\(userLocation.coordinate.latitude)")!
        
        longitude = (CLLocationDegrees) ("\(userLocation.coordinate.longitude)")!
        
        
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

