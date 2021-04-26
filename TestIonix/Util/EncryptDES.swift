//
//  EncryptDES.swift
//  TestIonix
//
//  Created by Ludin Jozabeth on 24-04-21.
//

import Foundation
import CommonCrypto

class CryptDES : NSObject {
    
    public func methodToCallEncryption( stringToEncrypt : String ) ->String {
        let iVValue:String? = nil
        let keyValue = "ionix123456"
        let encoded = stringToEncrypt.desEncrypt( key : keyValue , iv : iVValue )
        return encoded!
    }
    
    public func methodToCallDecryption( stringToDecrypt : String ) -> String{
        let iVValue:String? = nil
        let keyValue = "ionix123456"
        let decoded = stringToDecrypt.desEncrypt( key : keyValue , iv : iVValue )
        return decoded!
    }
}
extension String {
    
    func desEncrypt(key:String, iv:String?, options:Int = kCCOptionPKCS7Padding) -> String? {
        if let keyData = key.data(using: String.Encoding.utf8),
           let data = self.data(using: String.Encoding.utf8),
           let cryptData    = NSMutableData(length: Int((data.count)) + kCCBlockSizeDES) {
            
            let keyLength              = size_t(kCCKeySizeDES)
            let operation: CCOperation = UInt32(kCCEncrypt)
            let algoritm:  CCAlgorithm = UInt32(kCCAlgorithmDES)
            let options:   CCOptions   = UInt32(options)
            
            var numBytesEncrypted :size_t = 0
            
            let cryptStatus = CCCrypt(operation,
                                      algoritm,
                                      options,
                                      (keyData as NSData).bytes, keyLength,
                                      iv,
                                      (data as NSData).bytes, data.count,
                                      cryptData.mutableBytes, cryptData.length,
                                      &numBytesEncrypted)
            
            if UInt32(cryptStatus) == UInt32(kCCSuccess) {
                cryptData.length = Int(numBytesEncrypted)
                let base64cryptString = cryptData.base64EncodedString(options: .lineLength64Characters)
                return base64cryptString
                
            }
            else {
                return nil
            }
        }
        return nil
    }
}

