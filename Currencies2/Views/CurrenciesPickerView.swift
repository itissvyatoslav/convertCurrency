//
//  CurrenciesPickerView.swift
//  Currencies2
//
//  Created by Svyatoslav Vladimirovich on 05/03/2020.
//  Copyright © 2020 Svyatoslav Vladimirovich. All rights reserved.
//

import Foundation
import UIKit

class CurrenciesPickerView: UIViewController{
    @IBOutlet weak var currenciesPicker: UIPickerView!
    

    override func viewDidLoad(){
        super.viewDidLoad()
        configurePicker()
        configureViews()
        configureConstraints()
    }
    
    private func configurePicker(){
        currenciesPicker.dataSource = self
        currenciesPicker.delegate = self
    }
    
    private func configureViews(){
        currenciesPicker.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureConstraints(){
        NSLayoutConstraint.activate([
            currenciesPicker.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            currenciesPicker.leftAnchor.constraint(equalTo: view.leftAnchor),
            currenciesPicker.rightAnchor.constraint(equalTo: view.rightAnchor),
            currenciesPicker.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - UIPickerViewDataSource, UIPickerViewDelegate

extension CurrenciesPickerView: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currNames[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let value1 = pickerView.selectedRow(inComponent: 0)
        picked1Value = currNames[value1]
        let value2 = pickerView.selectedRow(inComponent: 1)
        picked2Value = currNames[value2]
        print(picked1Value)
        print(picked2Value)
    }
}
