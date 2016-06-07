
//  Copyright © 2016 mApp. All rights reserved.
import Foundation

struct ForecastDateTime {
  let rawDate: Double
  
  init(_ date: Double) {
    rawDate = date
  }
  
  var shortTime: String {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "HH:mm"
    let date = NSDate(timeIntervalSince1970: rawDate)
    return dateFormatter.stringFromDate(date)
  }
}
