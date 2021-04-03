//
//  Rot13.swift
//  ROT-13_Encryptor
//
//  Created by Kamil on 03/04/2021.
//

import Foundation

class RotEncrypt {
    
    var output = ""
    var bitMove = 0
    
    func encryptROT(textToEncrypt: String, typeOfEncrytion bitesToMove: Int = 13, decrypt: Bool = false) -> String {
        
        output = ""
        let asciiValues = textToEncrypt.compactMap { $0.asciiValue } // Converts sign into ASCII value
        
        if decrypt {
            self.bitMove = decrypt ? bitesToMove : abs(26 - bitesToMove) // If we need to decrypt we need to do reverse operation to e.g. rot-7 which is 7, we need 19, which can be done by getting abs value from 26 - 7 which is equal to 19
        }
        
        for encryption in 0..<asciiValues.count {
            
            var letterNumber = Int(asciiValues[encryption])

            switch letterNumber {
            case 65...90:
                letterNumber += bitMove
                if !(letterNumber >= 65 && letterNumber <= 90) { letterNumber -= 26 } // If range was overextended, it moves back letterNumber, till it will be in range again
            case 97...122:
                letterNumber += bitMove
                if !(letterNumber >= 97 && letterNumber <= 122) { letterNumber -= 26 } // If range was overextended, it moves back letterNumber, till it will be in range again
            default:
                break // If sign is e.g. number, it passes unaltered
            }
            let compleatedString = String(UnicodeScalar(UInt8(letterNumber)))
            output += compleatedString
        }
        return output
    }
}
