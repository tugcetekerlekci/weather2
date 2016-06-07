

//  Copyright © 2016 mApp. All rights reserved.
import UIKit
import Social
class ViewController2: UIViewController {
    
    @IBAction func shareTwitter(sender: AnyObject) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {
            
            var tweetShare:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            
            self.presentViewController(tweetShare, animated: true, completion: nil)
            
        } else {
            
            var alert = UIAlertController(title: "Accounts", message: "Please login to a Twitter account to tweet.", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    @IBAction func share(sender: AnyObject) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook) {
            let fbShare:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            
            self.presentViewController(fbShare, animated: true, completion: nil)
            
        } else {
            let alert = UIAlertController(title: "Accounts", message: "Please login to a Facebook account to share.", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }    }
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var iconLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet var forecastViews: [ForecastView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = WeatherByCityViewModel()
        viewModel?.startLocationService()
    }
    
    // MARK: ViewModel
    var viewModel: WeatherByCityViewModel? {
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
