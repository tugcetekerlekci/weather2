
//  Copyright © 2016 mApp. All rights reserved.
import Foundation

struct Temperature {
  let degrees: String
  
  init(country: String, openWeatherMapDegrees: Double) {
    if country == "US" {
     
      degrees = String(round(((openWeatherMapDegrees-273.15) * 1.8) + 32)) + "\u{f045}"
    } else {
      
      degrees = String(round(openWeatherMapDegrees - 273.15)) + "\u{f03c}"
    }
  }
}
