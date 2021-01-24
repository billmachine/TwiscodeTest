//
//  RemoteSource.swift
//  TwisCodeTest
//
//  Created by Ahmad Billi Afandi on 24/01/21.
//

import Foundation
import Alamofire

class RemoteSource {
    static let url = "https://ranting.twisdev.com/index.php/rest/items/search/api_key/teampsisthebest/"
    static let baseurlImage = "https://ranting.twisdev.com/uploads/"
    
    static func getData(completion: @escaping ((Result<[Product], Error>) -> Void)) {
        AF
            .request(self.url,method: .post) { urlRequest in urlRequest.timeoutInterval = 15 }
            .validate()
            .response { response in
                switch response.result {
                case .success(let rawResponse):
                    let products = self.mapJson(rawResponse)
                    completion(Result.success(products))
                case .failure(let error):
                    print(error)
                    completion(Result.failure(error))
                }
            }
    }
    
    static private func mapJson(_ rawResponse:Any)-> [Product] {
        let decoder = JSONDecoder()
        var outputProducts : [Product] = []
        
        guard let rawResponse = rawResponse as? Data else { return outputProducts }
        
        do {
            let products = try decoder.decode([Product].self, from: rawResponse)
            outputProducts = products
        }
        catch(let message) {
            print(message.localizedDescription)
        }
        return outputProducts
    }
    
}
