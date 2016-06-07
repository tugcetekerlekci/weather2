

import Foundation
import CoreLocation

typealias WeatherCompletionHandler = (Weather?, Error?) -> Void

protocol WeatherServiceProtocol {
  func retrieveWeatherInfo(location: CLLocation, completionHandler: WeatherCompletionHandler)
}
