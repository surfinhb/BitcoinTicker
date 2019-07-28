//  ViewController.swift
//  BitcoinTicker


import UIKit
import SwiftyJSON
import Alamofire

class ViewController: UIViewController,
//UIPicker
UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    var finalURL = ""

    //Pre-setup IBOutlets
    @IBOutlet weak var bitcoinPriceLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        
    }

    
    //TODO: Place your 3 UIPickerView delegate methods here
    
    //columns
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //rows
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyArray.count
    }
    
    //name row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyArray[row]
    }

    // pick row
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        callBitcoinAPI(baseURL + currencyArray[row])
    }
    
    
    
    //MARK: - Networking
    /***************************************************************/
    
    func callBitcoinAPI(_ url: string) {

        Alamofire.request(url, method: .get)
            .responseJSON { response in
                if response.result.isSuccess {

                    print("Sucess! Got the weather data")
                    let bitcoinJSON : JSON = JSON(response.result.value!)

                    self.updateWeatherData(json: bitcoinJSON)

                } else {
                    print("Error: \(String(describing: response.result.error))")
                    self.bitcoinPriceLabel.text = "Connection Issues"
                }
            }

    }

    
    
//
//    
//    //MARK: - JSON Parsing
//    /***************************************************************/
//    
//    func updateWeatherData(json : JSON) {
//        
//        if let tempResult = json["main"]["temp"].double {
//        
//        weatherData.temperature = Int(round(tempResult!) - 273.15)
//        weatherData.city = json["name"].stringValue
//        weatherData.condition = json["weather"][0]["id"].intValue
//        weatherData.weatherIconName =    weatherData.updateWeatherIcon(condition: weatherData.condition)
//        }
//        
//        updateUIWithWeatherData()
//    }
//    




}
