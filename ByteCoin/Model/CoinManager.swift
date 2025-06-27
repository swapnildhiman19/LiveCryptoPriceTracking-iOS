//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate: AnyObject {
    func didUpdateCoin(_ coinManager: CoinManager, coinValue: String)
    func didFailWithError(error: Error)
}

struct CoinManager {
    var delegate: CoinManagerDelegate?
    let baseURL = "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies="
    let apiKey = "YOUR_API_KEY_HERE" //NO API KEY IS REQUIRED

    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func getCoinPrice(for currency: String) {
        let urlString = baseURL + currency
        //        print(urlString)
        performRequest(with: urlString)
    }

    func performRequest(with urlString: String){
        /*
         1. Create URL
         2. Create URLSession
         3. Assigning the task
         4. Perform the task
         */
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default)
            let task = urlSession.dataTask(with: url) { data, response, error in
                if let safeData = data {
                    // Convert the Data into String
                                        if let responseString = String(data: safeData, encoding: .utf8)
                                        {
                                           print(responseString)
                                        }
                    // Parse the JSON data
                    if let coinModel = self.parseJSON(safeData) {
                        //Convert the double to string
                        let coinValueString = String(format: "%.2f", coinModel.currencyData)
                        self.delegate?.didUpdateCoin(self, coinValue: coinValueString)
                    }
                }
            }
            task.resume()
        }
    }

    func parseJSON(_ currencyData: Data)-> CoinModel? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(CoinData.self, from: currencyData)
            let coinValue = decodedData.bitcoin.values.first!
            let coinModel = CoinModel(currencyData: coinValue)
            return coinModel
//            print(value)
        } catch {
            self.delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
