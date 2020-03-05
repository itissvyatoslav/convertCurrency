//
//  CalculateCurrenciesViewController.swift
//  Currencies2
//
//  Created by Svyatoslav Vladimirovich on 05/03/2020.
//  Copyright © 2020 Svyatoslav Vladimirovich. All rights reserved.
//

import Foundation
import UIKit

class CalculateCurrenciesViewController: UIViewController {
    
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
        setFields()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setFields()
        configureViews()
        configureConstraints()
    }
    
    private func setFields(){
        currency1Label.text = picked1Value
        currency2Label.text = picked2Value
    }
//MARK: - Constraints
    private func configureViews(){
        self.view.backgroundColor = UIColor.white
        
        value1Field.translatesAutoresizingMaskIntoConstraints = false
        value2Field.translatesAutoresizingMaskIntoConstraints = false
        directionButton.translatesAutoresizingMaskIntoConstraints = false
        currency1Label.translatesAutoresizingMaskIntoConstraints = false
        currency2Label.translatesAutoresizingMaskIntoConstraints = false
        clearButton.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configureConstraints(){
        NSLayoutConstraint.activate([
            directionButton.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: -30),
            directionButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            directionButton.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: 15),
            
            value1Field.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            value1Field.rightAnchor.constraint(equalTo: directionButton.leftAnchor),
            value1Field.centerYAnchor.constraint(equalTo: directionButton.centerYAnchor),
            

            value2Field.leftAnchor.constraint(equalTo: directionButton.rightAnchor),
            value2Field.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            value2Field.centerYAnchor.constraint(equalTo: directionButton.centerYAnchor),
            
            changeCurrencyButton.centerXAnchor.constraint(equalTo: directionButton.centerXAnchor),
            changeCurrencyButton.centerYAnchor.constraint(equalTo: directionButton.centerYAnchor, constant: -20),
            
            currency1Label.centerXAnchor.constraint(equalTo: value1Field.centerXAnchor),
            currency1Label.centerYAnchor.constraint(equalTo: value1Field.centerYAnchor, constant: 40),
            
            currency2Label.centerXAnchor.constraint(equalTo: value2Field.centerXAnchor),
            currency2Label.centerYAnchor.constraint(equalTo: value2Field.centerYAnchor, constant: 40),
            
            clearButton.centerXAnchor.constraint(equalTo: directionButton.centerXAnchor),
            clearButton.centerYAnchor.constraint(equalTo: directionButton.centerYAnchor, constant: 40)
        ])
    }
// MARK: - Conventing algorithm
    private func conventing(){
        if (picked1Value == "") {
            noValuesError(title: "Ooops", message: "You didn't select currency")
        } else {
            if ((value1Field.text == "") && (value2Field.text == "")){
                noValuesError(title: "No values!", message: "Input something")
            } else
                if (((Double(value1Field.text!)) != nil) && ((value2Field.text!) == "")){
                    let result = counting(cur1: picked1Value, cur2: picked2Value, value1: Double(value1Field.text!)!)
                    value2Field.text = "\(result)"
                } else
                    if (((Double(value2Field.text!)) != nil) && ((value1Field.text!) == "")){
                        let result = counting(cur1: picked2Value, cur2: picked1Value, value1: Double(value2Field.text!)!)
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
            title: "CLose",
            style: .default,
            handler: { _ in
                alertController.dismiss(animated: true, completion: nil)
        }))
        present(alertController, animated: true, completion: nil)
    }
}

