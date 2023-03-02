//
//  WebSeervice.swift
//  CryptoTracking
//
//  Created by Özgür Salih Dülger on 2.03.2023.
//

import Foundation

class WebSeervice {
    
    func downloadCurrencies(url: URL, completion: @escaping([CryptoCurrency]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
               let cryptoList = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
                
                print(cryptoList)
                
                completion(cryptoList)
                
            }
        }.resume()
        
    }
    
    
}
