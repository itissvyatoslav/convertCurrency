//
//  DataModel.swift
//  Currencies2
//
//  Created by Svyatoslav Vladimirovich on 05/03/2020.
//  Copyright © 2020 Svyatoslav Vladimirovich. All rights reserved.
//

import Foundation

struct CurrResponse: Decodable {
    var Date: String?
    var PreviousDate: String?
    var PreviousURL: String?
    var Timestamp: String?
    var Valute: [String : Currency]
}


struct Currency: Decodable {
    var ID: String
    var NumCode: String
    var CharCode: String
    var Nominal: Double
    var Name: String
    var Value: Double
    var Previous: Double
}

var currTypes: [String: Currency] = [:]
var currNames: [String] = []
var picked1Value: String = ""
var picked2Value: String = ""
