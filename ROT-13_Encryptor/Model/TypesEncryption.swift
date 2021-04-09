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
        
        // 
        //EncryptionChosen(encryptionType: "ROT01", keyIsRequired: false, numberOfROT:  1, keyEntered: nil),
        // ROT
        EncryptionChosen(encryptionType: "ROT01", numberOfROT:  1),
        EncryptionChosen(encryptionType: "ROT02", numberOfROT:  2),
        EncryptionChosen(encryptionType: "ROT03", numberOfROT:  3),
        EncryptionChosen(encryptionType: "ROT04", numberOfROT:  4),
        EncryptionChosen(encryptionType: "ROT05", numberOfROT:  5),
        EncryptionChosen(encryptionType: "ROT06", numberOfROT:  6),
        EncryptionChosen(encryptionType: "ROT07", numberOfROT:  7),
        EncryptionChosen(encryptionType: "ROT08", numberOfROT:  8),
        EncryptionChosen(encryptionType: "ROT09", numberOfROT:  9),
        EncryptionChosen(encryptionType: "ROT10", numberOfROT: 10),
        EncryptionChosen(encryptionType: "ROT11", numberOfROT: 11),
        EncryptionChosen(encryptionType: "ROT12", numberOfROT: 12),
        EncryptionChosen(encryptionType: "ROT13", numberOfROT: 13),
        EncryptionChosen(encryptionType: "ROT14", numberOfROT: 14),
        EncryptionChosen(encryptionType: "ROT15", numberOfROT: 15),
        EncryptionChosen(encryptionType: "ROT16", numberOfROT: 16),
        EncryptionChosen(encryptionType: "ROT17", numberOfROT: 17),
        EncryptionChosen(encryptionType: "ROT18", numberOfROT: 18),
        EncryptionChosen(encryptionType: "ROT19", numberOfROT: 19),
        EncryptionChosen(encryptionType: "ROT20", numberOfROT: 20),
        EncryptionChosen(encryptionType: "ROT21", numberOfROT: 21),
        EncryptionChosen(encryptionType: "ROT22", numberOfROT: 22),
        EncryptionChosen(encryptionType: "ROT23", numberOfROT: 23),
        EncryptionChosen(encryptionType: "ROT24", numberOfROT: 24),
        EncryptionChosen(encryptionType: "ROT25", numberOfROT: 25),
        
        // Other
        EncryptionChosen(encryptionType: "Caesar cipher", numberOfROT: 3), // Caesar cipher == ROT03
        EncryptionChosen(encryptionType: "ROT47", numberOfROT: 47),
        //
        // Decrypting is not working correctly yet
        EncryptionChosen(encryptionType: "Bacon's cipher", numberOfROT: nil) // 2nd version is going to be used
        
    ]
    
    func getNameROT(numberIndex: Int) -> String {
        return encrypt[numberIndex].encryptionType
    }
    func getNumberOfROT(numberIndex: Int) -> Int {
        return encrypt[numberIndex].numberOfROT ?? 0
    }
    func getIndex(encryptionType: String) -> Int{
        return encrypt.firstIndex(where: { $0.encryptionType == encryptionType }) ?? 0
    }
}
