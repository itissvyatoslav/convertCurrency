//
//  Service.swift
//  Currencies2
//
//  Created by Svyatoslav Vladimirovich on 05/03/2020.
//  Copyright © 2020 Svyatoslav Vladimirovich. All rights reserved.
//

import Foundation

class NetworkService {
    let actualValute = Valute.sharedValute
    
    func loadingCurrency(completion: @escaping (Valute.CurrResponse?) -> Void) {
        let urlString = "https://www.cbr-xml-daily.ru/daily_json.js"
        guard let url = URL(string: urlString) else {
            print("Error url")
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print("Error received data, check website: \(urlString)")
                completion(nil)
                return
            }
            guard error == nil else {
                print("Failed decoding")
                completion(nil)
                return
            }
            do {
                let actualCurruncies = try JSONDecoder().decode(Valute.CurrResponse.self, from: data)
                completion(actualCurruncies)
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    func loadData() {
        let networkService = NetworkService()
        networkService.loadingCurrency { (currResponse) in
            self.actualValute.currTypes = currResponse?.Valute ?? [:]
            for name in (self.actualValute.currTypes.values){
                self.actualValute.currNames.append(name.CharCode)
            }
            self.actualValute.picked1Value = ""
            self.actualValute.picked2Value = ""
        }
    }
}
