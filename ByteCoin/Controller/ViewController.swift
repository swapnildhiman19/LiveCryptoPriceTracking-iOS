//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bitCoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    var coinManager = CoinManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.dataSource = self //Protocol you must adopt; its methods give the picker the structure of your data.
        currencyPicker.delegate = self //Handles what’s displayed and how the user interacts.
        coinManager.delegate = self
    }


}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //return number of wheels/Columns
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //returns the number of rows/options
        return coinManager.currencyArray.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row] //What data needs to be displayed at each row (UIPickerViewDelegate)
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //What should happen when user selects a specific row
//        print(coinManager.currencyArray[row])
        let selectedCurrency = coinManager.currencyArray[row]
        currencyLabel.text = selectedCurrency
        coinManager.getCoinPrice(for: selectedCurrency)
    }
}

extension ViewController: CoinManagerDelegate{
    func didUpdateCoin(_ coinManager: CoinManager, coinValue: String) {
        DispatchQueue.main.async {
            self.bitCoinLabel.text = coinValue
        }
    }
    
    func didFailWithError(error: any Error) {
        print("Failed with error: \(error)")
    }
}
