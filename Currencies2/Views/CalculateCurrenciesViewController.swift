//
//  CalculateCurrenciesViewController.swift
//  Currencies2
//
//  Created by Svyatoslav Vladimirovich on 05/03/2020.
//  Copyright © 2020 Svyatoslav Vladimirovich. All rights reserved.
//

import Foundation
import UIKit

class CalculateCurrenciesViewController: UIViewController, CurrenciesPickerViewDelegate {
    let actualValute = Valute.sharedValute
    
    @IBOutlet weak var changeCurrencyButton: UIButton!
    @IBOutlet weak var value1Field: UITextField!
    @IBOutlet weak var value2Field: UITextField!
    @IBOutlet weak var directionButton: UIButton!
    @IBOutlet weak var currency1Label: UILabel!
    @IBOutlet weak var currency2Label: UILabel!
    @IBOutlet weak var clearButton: UIButton!
//MARK: - Buttons' action
    @IBAction func clearActionButton(_ sender: Any) {
        value1Field.text = ""
        value2Field.text = ""
    }
    @IBAction func pushButtonAction(_ sender: Any) {
        conventing()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setFields()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "getCurrency" {
            let destinationVC = segue.destination as! CurrenciesPickerView
            destinationVC.delegate = self
        }
    }
    
    func fillCurrencies(_ cur1: String, _ cur2: String) {
        currency1Label.text = cur1
        currency2Label.text = cur2
    }
    
    private func setFields(){
        currency1Label.text = actualValute.picked1Value
        currency2Label.text = actualValute.picked2Value
    }

// MARK: - Conventing algorithm
    
    private func counting(cur1 :String, cur2 :String, value1: Double) -> Double{
        let value2 = value1 * (actualValute.currTypes[cur1]!.Value) / (actualValute.currTypes[cur1]!.Nominal) * (actualValute.currTypes[cur2]!.Nominal) / (actualValute.currTypes[cur2]!.Value)
        return value2
    }
    
    private func conventing(){
        if (actualValute.picked1Value == "") {
            noValuesError(title: "Ooops", message: "You didn't select currency")
        } else {
            if ((value1Field.text == "") && (value2Field.text == "")){
                noValuesError(title: "No values!", message: "Input something")
            } else
                if (((Double(value1Field.text!)) != nil) && ((value2Field.text!) == "")){
                    let result = counting(cur1: actualValute.picked1Value, cur2: actualValute.picked2Value, value1: Double(value1Field.text!)!)
                    value2Field.text = "\(result)"
                } else
                    if (((Double(value2Field.text!)) != nil) && ((value1Field.text!) == "")){
                        let result = counting(cur1: actualValute.picked2Value, cur2: actualValute.picked1Value, value1: Double(value2Field.text!)!)
                        value1Field.text = "\(result)"
                    } else {
                        noValuesError(title: "Clean!", message: "Try one more time")
            }
        }
    }
// MARK: - Error windows
    
    private func noValuesError(title: String, message: String){
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        alertController.addAction(UIAlertAction(
            title: "Close",
            style: .default,
            handler: { _ in
                alertController.dismiss(animated: true, completion: nil)
        }))
        present(alertController, animated: true, completion: nil)
    }
}

