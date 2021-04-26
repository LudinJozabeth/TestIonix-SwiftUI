//
//  ServRut.swift
//  TestIonix
//
//  Created by Ludin Jozabeth on 24-04-21.
//

// MARK: - ServRut
struct ServRut: Codable {
    let responseCode: Int?
    let description: String?
    let result: Result?

    enum CodingKeys: String, CodingKey {
        case responseCode
        case description
        case result
    }
}

// MARK: - Result
struct Result: Codable {
    let items: [Item]?
}

// MARK: - Item
struct Item: Codable {
    let name: String?
    let detail: Detail?
}

// MARK: - Detail
struct Detail: Codable {
    let email, phoneNumber: String?

    enum CodingKeys: String, CodingKey {
        case email
        case phoneNumber = "phone_number"
    }
}
