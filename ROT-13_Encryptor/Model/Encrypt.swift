//
//  Encrypt.swift
//  ROT-13_Encryptor
//
//  Created by Kamil on 10/04/2021.
//

import Foundation

struct Encrypt {
    func encrypt(textToEncrypt: String, nameOfEncrytion: String, typeOfROTEncrytion: Int, decrypt: Bool) -> String {
        
        //
        // Other Encrypt
        //
        
        if typeOfROTEncrytion == 0 {
            // If type is not ROT, for example Bacon's cipher then do this...
            //
            switch nameOfEncrytion {
            case "Bacon's cipher":
                var baconEncrypt = BaconEncrypt()
                return baconEncrypt.encryptBacon(textToEncrypt: textToEncrypt, decrypt: decrypt)
            //case "Another cipher":
            //
            default:
                print("nameOfEncrytion not found")
                return ""
            }
        }
        
        //
        // Rot Encrypt
        //
        
        var rotEncrypt = RotEncrypt()
        
        if typeOfROTEncrytion == 47 {
            // ROT47 has diffrent alphabet, therefor we need another function
            // Plus on top of that, it is inverse function, so we don need decrypt value, as both have the same outcome
            return rotEncrypt.encryptROT47(textToEncrypt: textToEncrypt)
        } else {
            return rotEncrypt.encryptROT(textToEncrypt: textToEncrypt, typeOfROTEncrytion: typeOfROTEncrytion, decrypt: decrypt)
        }
        
        
    }
}
