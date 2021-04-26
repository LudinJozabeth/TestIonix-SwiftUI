//
//  RutViewModel.swift
//  TestIonix
//
//  Created by Ludin Jozabeth on 24-04-21.
//

import Foundation

class RutViewModel : NSObject {
    private var apiServiceRut : APIServiceRUT!
    var respDataRUT: Item!
    private var rutEncrypt = UserDefaults.standard.object(forKey: "rutEncrypt") as! String
    
    override init() {
        super.init()
        self.apiServiceRut =  APIServiceRUT()
    }
    
    func callFuncToGetRUTUserData(completion : @escaping  ( _ data: Item) -> () ) {
        self.apiServiceRut.apiToGetRutData(rutEncrypt: rutEncrypt ){ (data) in
            self.respDataRUT = data
            completion( data)
        }
    }
}
