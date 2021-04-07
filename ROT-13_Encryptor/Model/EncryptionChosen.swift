//
//  EncryptionChosen.swift
//  ROT-13_Encryptor
//
//  Created by Kamil on 06/04/2021.
//

import Foundation

struct EncryptionChosen {
    
    // keyIsRequired and keyEntered might be removed in the future...
    
    let encryptionType: String
    let keyIsRequired: Bool
    let numberOfROT: Int?
    var keyEntered: String?
    
    init(encryptionType: String, keyIsRequired: Bool, numberOfROT: Int?, keyEntered: String?) {
        self.encryptionType = encryptionType
        self.keyIsRequired = keyIsRequired
        self.numberOfROT = numberOfROT
        self.keyEntered = keyEntered
    }
}
