//
//  User.swift
//  TestIonix
//
//  Created by Ludin Jozabeth on 24-04-21.
//

import Foundation

// MARK: - User
struct User: Codable {
    let address: Address?
    let company: Company?
    let email: String?
    let id: Int?
    let name, phone, username, website: String?
}

// MARK: - Address
struct Address: Codable {
    let city: String?
    let geo: Geo?
    let street, suite, zipcode: String?
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String?
}

// MARK: - Company
struct Company: Codable {
    let bs, catchPhrase, name: String?
}

