//
//  Encrypt.swift
//  ROT-13_Encryptor
//
//  Created by Kamil on 10/04/2021.
//

import Foundation

struct Encrypt {
    func encrypt(textToEncrypt: String, nameOfEncrytion: String, typeOfROTEncrytion: Int?, decrypt: Bool) -> String {
        let typeOfROTEncrytionUnwraped = typeOfROTEncrytion ?? 0
        if typeOfROTEncrytionUnwraped == 0 {
            switch nameOfEncrytion {
            case "Bacon's cipher":
                var baconEncrypt = BaconEncrypt()
                return baconEncrypt.encryptBacon(textToEncrypt: textToEncrypt, decrypt: decrypt)
                //return "Bacon's cipher"
            default:
                print("nameOfEncrytion not found")
                return ""
            }
        }
        var rotEncrypt = RotEncrypt()
        if typeOfROTEncrytionUnwraped == 47 {
            return rotEncrypt.encryptROT47(textToEncrypt: textToEncrypt)
        } else {
            return rotEncrypt.encryptROT(textToEncrypt: textToEncrypt, typeOfROTEncrytion: typeOfROTEncrytionUnwraped, decrypt: decrypt)
        }
        
        
    }
}
