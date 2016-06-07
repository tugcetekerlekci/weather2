

//  Copyright © 2016 mApp. All rights reserved.
import Foundation
import CoreLocation

protocol LocationServiceDelegate {
  func locationDidUpdate(service: LocationService, location: CLLocation)
}

class LocationService : NSObject {
  var delegate: LocationServiceDelegate?
  
  private let manager = CLLocationManager()
  
  override init() {
    super.init()
    
    manager.delegate = self
    manager.desiredAccuracy = kCLLocationAccuracyHundredMeters
  }
  
  func requestLocation() {
     manager.requestWhenInUseAuthorization()
     manager.requestLocation()
      manager.startUpdatingLocation()
  }
}

// MARK: - CLLocationManagerDelegate
extension LocationService : CLLocationManagerDelegate {
  func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    if let location = locations.first {
         //let userLocation:CLLocation = locations[0]
      print("Current location: \(location)")
      delegate?.locationDidUpdate(self, location: location);
    }
   /* print(locations)
    
    //userLocation - there is no need for casting, because we are now using CLLocation object
    
    let userLocation:CLLocation = locations[0]
    
    let lat = (CLLocationDegrees)("\(userLocation.coordinate.latitude)")!
    
    let lon = (CLLocationDegrees) ("\(userLocation.coordinate.longitude)")!
    print(lat)
    print(lon)*/
    
  }
  
  func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
    print("Error finding location: \(error.localizedDescription)")
  }
}