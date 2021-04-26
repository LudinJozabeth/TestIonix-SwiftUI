//
//  TestIonixTests.swift
//  TestIonixTests
//
//  Created by Ludin Jozabeth on 22-04-21.
//

import XCTest
@testable import TestIonix

class TestIonixTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testEncryptation() throws {
        let string = "1-9"
        let stringEncrypt = CryptDES().methodToCallEncryption(stringToEncrypt: string)
        XCTAssertTrue(stringEncrypt == "FyaSTkGi8So=")
    }
    
    func testEncryptationFail() throws {
        let string = "1-9"
        let stringEncrypt = CryptDES().methodToCallEncryption(stringToEncrypt: string)
        XCTAssertFalse(stringEncrypt == "FyaSTkGi8So*")
    }
    
    func testApiServGetUser() throws {
        let obj = APIService()
        obj.apiToGetUsersData ( completion: { (data) in
            XCTAssertNotNil(data)
        })
    }
    
    func testApiServRut() throws {
        let obj = APIServiceRUT()
        obj.apiToGetRutData(rutEncrypt: "FyaSTkGi8So*" ) { (data) in
            XCTAssertNotNil(data)
        }
    }

    func testPerformanceExample() throws {
        self.measure {
        }
    }

}
