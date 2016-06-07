
//  Copyright © 2016 mApp. All rights reserved.
import Foundation
import CoreLocation

class WeatherByCityViewModel {
    
    private let EmptyString = ""
    
    
    let hasError: Observable<Bool>
    let errorMessage: Observable<String?>
    
    let location: Observable<String>
    let iconText: Observable<String>
    let temperature: Observable<String>
    let forecasts: Observable<[ForecastViewModel]>
    
    private var locationService: LocationService
    private var weatherService: WeatherServiceProtocol
    
    
    init() {
        hasError = Observable(false)
        errorMessage = Observable(nil)
        
        location = Observable(EmptyString)
        iconText = Observable(EmptyString)
        temperature = Observable(EmptyString)
        forecasts = Observable([])
        
        
        locationService = LocationService()
        weatherService = WeatherByCity()
    }
    
    
    func startLocationService() {
        locationService.delegate = self
        locationService.requestLocation()
    }
    
    
    private func update(weather: Weather) {
        hasError.value = false
        errorMessage.value = nil
        
        location.value = weather.location
        iconText.value = weather.iconText
        temperature.value = weather.temperature
        
        let tempForecasts = weather.forecasts.map { forecast in
            return ForecastViewModel(forecast)
        }
        forecasts.value = tempForecasts
    }
    
    private func update(error: Error) {
        hasError.value = true
        
        switch error.errorCode {
        case .URLError:
            errorMessage.value = "ERROR"
        case .NetworkRequestFailed:
            errorMessage.value = "ERROR"
        case .JSONSerializationFailed:
            errorMessage.value = "ERROR"
        case .JSONParsingFailed:
            errorMessage.value = "ERROR"
        }
        
        location.value = EmptyString
        iconText.value = EmptyString
        temperature.value = EmptyString
        self.forecasts.value = []
    }
}


extension WeatherByCityViewModel: LocationServiceDelegate {
    func locationDidUpdate(service: LocationService, location: CLLocation) {
        weatherService.retrieveWeatherInfo(location) { (weather, error) -> Void in
            dispatch_async(dispatch_get_main_queue(), {
                if let unwrappedError = error {
                    print(unwrappedError)
                    self.update(unwrappedError)
                    return
                }
                
                guard let unwrappedWeather = weather else {
                    return
                }
                self.update(unwrappedWeather)
            })
        }
    }
}
