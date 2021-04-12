//
//  EncryptionChosen.swift
//  ROT-13_Encryptor
//
//  Created by Kamil on 06/04/2021.
//

import Foundation

struct EncryptionChosen {
    
    // Defines the struct of needed componetnts for encryption
    
    let encryptionType: String
    let numberOfROT: Int?
    
    init(encryptionType: String, numberOfROT: Int?) {
        self.encryptionType = encryptionType
        self.numberOfROT = numberOfROT
    }
}
