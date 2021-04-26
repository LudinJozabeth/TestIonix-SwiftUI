//
//  APIService.swift
//  TestIonix
//
//  Created by Ludin Jozabeth on 23-04-21.
//

import Foundation
import Alamofire

class APIService :  NSObject {
    var users : [User]!
    private let sourcesURL = URL(string: "https://jsonplaceholder.typicode.com/users")!
    
    func apiToGetUsersData(completion : @escaping  ( _ data: [User]) -> () ){
        AF.request(sourcesURL, parameters: nil, encoding: URLEncoding.queryString, headers: nil)
            .validate()
            .responseJSON { response in
                switch (response.result) {
                case .success( _):
                    do {
                        let users = try JSONDecoder().decode([User].self, from: response.data!)
                        self.users = users
                        completion(users)
                    } catch let error as NSError {
                        print("Failed to load: \(error.localizedDescription)")
                    }
                case .failure(let error):
                    print("Request error: \(error.localizedDescription)")
                }
            }
    }
}
