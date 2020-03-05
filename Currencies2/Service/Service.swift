//
//  Service.swift
//  Currencies2
//
//  Created by Svyatoslav Vladimirovich on 05/03/2020.
//  Copyright © 2020 Svyatoslav Vladimirovich. All rights reserved.
//

import Foundation

class NetworkService {
    func loadingCurrency(completion: @escaping (CurrResponse?) -> Void) {
        let urlString = "https://www.cbr-xml-daily.ru/daily_json.js"
        guard let url = URL(string: urlString) else {
            print("Error url")
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print("Error received data")
                completion(nil)
                return
            }
            guard error == nil else {
                print("Failed decoding")
                completion(nil)
                return
            }
            do {
                let actualCurruncies = try JSONDecoder().decode(CurrResponse.self, from: data)
                completion(actualCurruncies)
            } catch let error {
                print(error)
            }
        }.resume()
    }
}

func loadData(){
    let networkService = NetworkService()
    networkService.loadingCurrency { (currResponse) in
        currTypes = currResponse?.Valute ?? [:]
        for name in (currTypes.values){
            currNames.append(name.CharCode)
        }
    }
}

//MARK: - Counting algorithm
func counting(cur1 :String, cur2 :String, value1: Double) -> Double{
    let value2 = value1 * (currTypes[cur1]!.Value) / (currTypes[cur1]!.Nominal) * (currTypes[cur2]!.Nominal) / (currTypes[cur2]!.Value)
    return value2
}
