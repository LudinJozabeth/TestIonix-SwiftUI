//
//  UserViewModel.swift
//  TestIonix
//
//  Created by Ludin Jozabeth on 24-04-21.
//

import Foundation

class UserViewModel : NSObject {
    var respDataUsers : [User]!
    private var apiService : APIService!
    
    override init() {
        super.init()
        self.apiService =  APIService()
    }
    
    func callFuncToGetUsersData(completion : @escaping  ( _ data: [User]) -> () ) {
        self.apiService.apiToGetUsersData( ){ (data) in
            self.respDataUsers = data
            completion( data)
        }
    }
}
