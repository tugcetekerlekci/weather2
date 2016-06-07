

//  Copyright © 2016 mApp. All rights reserved.
import UIKit

class WeatherViewController: UIViewController {
  
  @IBOutlet weak var locationLabel: UILabel!
  @IBOutlet weak var iconLabel: UILabel!
  @IBOutlet weak var temperatureLabel: UILabel!
  @IBOutlet var forecastViews: [ForecastView]!

    @IBOutlet weak var date: UILabel!
  override func viewDidLoad() {
    super.viewDidLoad()
    let date = NSDate()
    let calendar = NSCalendar.currentCalendar()
    let components = calendar.components([.Day , .Month , .Year], fromDate: date)
    
    let year =  components.year
    let month = components.month
    let day = components.day
    self.date.text=String(month)+"/"+String(day)+"/"+String(year)
    viewModel = WeatherViewModel()
    viewModel?.startLocationService()
    
    
  }

  // MARK: ViewModel
  var viewModel: WeatherViewModel? {
    didSet {
      viewModel?.location.observe {
        [unowned self] in
        self.locationLabel.text = $0
      }

      viewModel?.iconText.observe {
        [unowned self] in
        self.iconLabel.text = $0
      }

      viewModel?.temperature.observe {
        [unowned self] in
        self.temperatureLabel.text = $0
      }

      viewModel?.forecasts.observe {
        [unowned self] (let forecastViewModels) in
        if forecastViewModels.count >= 4 {
          for (index, forecastView) in self.forecastViews.enumerate() {
            forecastView.loadViewModel(forecastViewModels[index])
          }
        }
      }
    }
  }
}
