//
//  APIServiceRUT.swift
//  TestIonix
//
//  Created by Ludin Jozabeth on 24-04-21.
//

import Foundation
import Alamofire

class APIServiceRUT :  NSObject {
    @objc public static let shared = APIServiceRUT()
    var user : Item!
    
    func apiToGetRutData(rutEncrypt: String, completion : @escaping  ( _ data: Item) -> () ){
        let sourcesURL = URL(string: "https://sandbox.ionix.cl/test-tecnico/search?rut=\(rutEncrypt)"  )!
        _ = AF.request(sourcesURL, parameters: nil, encoding: URLEncoding.queryString, headers: nil)
            .validate()
            .responseJSON { response in
                switch (response.result) {
                case .success( _):
                    do {
                        let rutData = try JSONDecoder().decode(ServRut.self, from: response.data!)
                        self.user = rutData.result?.items?[2]
                        completion( self.user)
                    } catch let error as NSError {
                        print("Failed to load: \(error.localizedDescription)")
                    }
                case .failure(let error):
                    print("Request error: \(error.localizedDescription)")
                }
            }
    }    
}
