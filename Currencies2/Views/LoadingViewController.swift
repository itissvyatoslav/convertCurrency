//
//  LoadingViewController.swift
//  Currencies2
//
//  Created by Svyatoslav Vladimirovich on 07/03/2020.
//  Copyright © 2020 Svyatoslav Vladimirovich. All rights reserved.
//

import Foundation
import UIKit

class LoadingViewController: UIViewController{
    @IBAction func pushButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "seagueLoaded", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if loadData() == true {
            performSegue(withIdentifier: "seagueLoaded", sender: self)
        }
    }
}
