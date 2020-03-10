//
//  CurrenciesPickerView.swift
//  Currencies2
//
//  Created by Svyatoslav Vladimirovich on 05/03/2020.
//  Copyright © 2020 Svyatoslav Vladimirovich. All rights reserved.
//

import Foundation
import UIKit

protocol CurrenciesPickerViewDelegate {
    func fillCurrencies(_ cur1: String, _ cur2: String)
}

class CurrenciesPickerView: UIViewController{
    
    let actualValute = Valute.sharedValute
    
    var delegate: CurrenciesPickerViewDelegate?
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var currenciesPicker: UIPickerView!
    @IBAction func saveActionButton(_ sender: Any) {
        let cur1 = actualValute.picked1Value
        let cur2 = actualValute.picked2Value
        delegate?.fillCurrencies(cur1, cur2)
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        configurePicker()
    }
    
    private func configurePicker(){
        currenciesPicker.dataSource = self
        currenciesPicker.delegate = self
    }
}

// MARK: - UIPickerViewDataSource, UIPickerViewDelegate

extension CurrenciesPickerView: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return actualValute.currNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return actualValute.currNames[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let value1 = pickerView.selectedRow(inComponent: 0)
        actualValute.picked1Value = actualValute.currNames[value1]
        let value2 = pickerView.selectedRow(inComponent: 1)
        actualValute.picked2Value = actualValute.currNames[value2]
        print(actualValute.picked1Value)
        print(actualValute.picked2Value)
    }
}
