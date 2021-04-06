//
//  TypesEncryption.swift
//  ROT-13_Encryptor
//
//  Created by Kamil on 06/04/2021.
//

import Foundation

struct TypesEncryption {
    
    var numberIndex: Int = 0
    
    let encrypt = [
        
        // ROT
        EncryptionChosen(encryptionType: "ROT01", keyIsRequired: false, numberOfROT:  1, keyEntered: nil),
        EncryptionChosen(encryptionType: "ROT02", keyIsRequired: false, numberOfROT:  2, keyEntered: nil),
        EncryptionChosen(encryptionType: "ROT03", keyIsRequired: false, numberOfROT:  3, keyEntered: nil),
        EncryptionChosen(encryptionType: "ROT04", keyIsRequired: false, numberOfROT:  4, keyEntered: nil),
        EncryptionChosen(encryptionType: "ROT05", keyIsRequired: false, numberOfROT:  5, keyEntered: nil),
        EncryptionChosen(encryptionType: "ROT06", keyIsRequired: false, numberOfROT:  6, keyEntered: nil),
        EncryptionChosen(encryptionType: "ROT07", keyIsRequired: false, numberOfROT:  7, keyEntered: nil),
        EncryptionChosen(encryptionType: "ROT08", keyIsRequired: false, numberOfROT:  8, keyEntered: nil),
        EncryptionChosen(encryptionType: "ROT09", keyIsRequired: false, numberOfROT:  9, keyEntered: nil),
        EncryptionChosen(encryptionType: "ROT10", keyIsRequired: false, numberOfROT: 10, keyEntered: nil),
        EncryptionChosen(encryptionType: "ROT11", keyIsRequired: false, numberOfROT: 11, keyEntered: nil),
        EncryptionChosen(encryptionType: "ROT12", keyIsRequired: false, numberOfROT: 12, keyEntered: nil),
        EncryptionChosen(encryptionType: "ROT13", keyIsRequired: false, numberOfROT: 13, keyEntered: nil),
        EncryptionChosen(encryptionType: "ROT14", keyIsRequired: false, numberOfROT: 14, keyEntered: nil),
        EncryptionChosen(encryptionType: "ROT15", keyIsRequired: false, numberOfROT: 15, keyEntered: nil),
        EncryptionChosen(encryptionType: "ROT16", keyIsRequired: false, numberOfROT: 16, keyEntered: nil),
        EncryptionChosen(encryptionType: "ROT17", keyIsRequired: false, numberOfROT: 17, keyEntered: nil),
        EncryptionChosen(encryptionType: "ROT18", keyIsRequired: false, numberOfROT: 18, keyEntered: nil),
        EncryptionChosen(encryptionType: "ROT19", keyIsRequired: false, numberOfROT: 19, keyEntered: nil),
        EncryptionChosen(encryptionType: "ROT20", keyIsRequired: false, numberOfROT: 20, keyEntered: nil),
        EncryptionChosen(encryptionType: "ROT21", keyIsRequired: false, numberOfROT: 21, keyEntered: nil),
        EncryptionChosen(encryptionType: "ROT22", keyIsRequired: false, numberOfROT: 22, keyEntered: nil),
        EncryptionChosen(encryptionType: "ROT23", keyIsRequired: false, numberOfROT: 23, keyEntered: nil),
        EncryptionChosen(encryptionType: "ROT24", keyIsRequired: false, numberOfROT: 24, keyEntered: nil),
        EncryptionChosen(encryptionType: "ROT25", keyIsRequired: false, numberOfROT: 25, keyEntered: nil),
        
        // Other
        EncryptionChosen(encryptionType: "Caesar cipher", keyIsRequired: false, numberOfROT: 3, keyEntered: nil), // Caesar cipher == ROT03
        EncryptionChosen(encryptionType: "ROT47", keyIsRequired: false, numberOfROT: 47, keyEntered: nil),
        // not yet implemented
        //
        EncryptionChosen(encryptionType: "Bacon's cipher", keyIsRequired: true, numberOfROT: nil, keyEntered: "") // 2nd version is going to be used
        
    ]
    
    func getNameROT(numberIndex: Int) -> String {
        return encrypt[numberIndex].encryptionType
    }
}
