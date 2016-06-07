
import Foundation
import CoreLocation


import SwiftyJSON

var latit:Double=0.0
var longit:Double=0.0
var city1=" "
var country1=" "
struct WeatherByCity: WeatherServiceProtocol {
    private let urlPath = "http://api.openweathermap.org/data/2.5/forecast"
    func retrieveWeatherInfo(location: CLLocation, completionHandler: WeatherCompletionHandler) {
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: sessionConfig)
        
        guard let url = generateRequestURL(location) else {
            let error = Error(errorCode: .URLError)
            completionHandler(nil, error)
            return
        }
        
        print(url)
        let request = NSURLRequest(URL: url)
        let task = session.dataTaskWithRequest(request, completionHandler: { (data, response, networkError) -> Void in
            
            // Check network error
            if networkError != nil {
                let error = Error(errorCode: .NetworkRequestFailed)
                completionHandler(nil, error)
                return
            }
            
            // Check JSON serialization error
            guard let unwrappedData = data else {
                let error = Error(errorCode: .JSONSerializationFailed)
                completionHandler(nil, error)
                return
            }
            
            let json = JSON(data: unwrappedData)
            
            
            guard let tempDegrees = json["list"][0]["main"]["temp"].double,
                country = json["city"]["country"].string,
                city = json["city"]["name"].string,
                weatherCondition = json["list"][0]["weather"][0]["id"].int,
                iconString = json["list"][0]["weather"][0]["icon"].string else {
                    let error = Error(errorCode: .JSONParsingFailed)
                    completionHandler(nil, error)
                    return
            }
            print(city)
            
            let lat=json["city"]["coord"]["lat"].double
            print(lat)
            
            let lon=json["city"]["coord"]["lon"].double
            print(lon)
            
            country1 = json["city"]["country"].string!
            city1 = json["city"]["name"].string!
            
            var weatherBuilder = WeatherBuilder()
            let temperature = Temperature(country: country, openWeatherMapDegrees:tempDegrees)
            weatherBuilder.temperature = temperature.degrees
            weatherBuilder.location = city
            let weatherIcon = WeatherIcon(condition: weatherCondition, iconString: iconString)
            weatherBuilder.iconText = weatherIcon.iconText
            
            longit=lon!
            latit=lat!
          
            var forecasts: [Forecast] = []
            for index in 0...3 {
                guard let forecastTempDegrees = json["list"][index]["main"]["temp"].double,
                    rawDateTime = json["list"][index]["dt"].double,
                    forecastCondition = json["list"][index]["weather"][0]["id"].int,
                    forecastIcon = json["list"][index]["weather"][0]["icon"].string else {
                        break
                }
                
                let forecastTemperature = Temperature(country: country, openWeatherMapDegrees: forecastTempDegrees)
                let forecastTimeString = ForecastDateTime(rawDateTime).shortTime
                let weatherIcon = WeatherIcon(condition: forecastCondition, iconString: forecastIcon)
                let forcastIconText = weatherIcon.iconText
                
                let forecast = Forecast(time: forecastTimeString,
                    iconText: forcastIconText,
                    temperature: forecastTemperature.degrees)
                
                forecasts.append(forecast)
            }
            
            weatherBuilder.forecasts = forecasts
            
            completionHandler(weatherBuilder.build(), nil)
        })
        
        task.resume()
    }
    
    private func generateRequestURL(location: CLLocation) -> NSURL? {
        guard let components = NSURLComponents(string:urlPath) else {
            return nil
        }
        
        // get appId from Info.plist
        let filePath = NSBundle.mainBundle().pathForResource("Info", ofType: "plist")!
        let parameters = NSDictionary(contentsOfFile:filePath)
        let appId = parameters!["OWMAccessToken"]!.description
        
        components.queryItems = [NSURLQueryItem(name:"q", value:String(input)),
            //NSURLQueryItem(name:"lon", value:String(location.coordinate.longitude)),
            NSURLQueryItem(name:"appid", value:String(appId))]
        
        return components.URL
    }
}
