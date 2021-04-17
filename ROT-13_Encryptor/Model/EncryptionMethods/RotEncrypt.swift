//
//  Rot13.swift
//  ROT-13_Encryptor
//
//  Created by Kamil on 03/04/2021.
//

import Foundation

struct RotEncrypt {
    
    var output: String = ""
    var bitMove: Int = 0
    
    mutating func encryptROT(textToEncrypt: String, typeOfROTEncrytion bitesToMove: Int, decrypt: Bool ) -> String {
        
        output = ""
        bitMove = decrypt ? 26 - bitesToMove : bitesToMove // If we need to decrypt we need to do reverse operation to e.g. rot-7 which is 7, we need 19, which can be done by getting value from 26 - 7 which is equal to 19
        let asciiValues = textToEncrypt.compactMap { $0.asciiValue } // Converts sign into ASCII value
        
        for encryption in 0..<asciiValues.count {
            var letterNumber = Int(asciiValues[encryption])
            switch letterNumber {
                case 65...90:
                    letterNumber += bitMove
                    if !(letterNumber >= 65 && letterNumber <= 90) { letterNumber -= 26 } // If range was  overextended, it moves back letterNumber, till it will be in range again
                case 97...122:
                    letterNumber += bitMove
                    if !(letterNumber >= 97 && letterNumber <= 122) { letterNumber -= 26 } // If range was overextended, it moves back letterNumber, till it will be in range again
                default:
                    break // If sign is e.g. number, it passes unaltered
            }
            let transformedLetter = String(UnicodeScalar(UInt8(letterNumber)))
            output += transformedLetter
        }
        return output
    }
    
    mutating func encryptROT47(textToEncrypt: String, typeOfROTEncrytion bitesToMove: Int = 47) -> String {
        
        output = ""
        bitMove = bitesToMove
        let asciiValues = textToEncrypt.compactMap { $0.asciiValue } // Converts sign into ASCII value
        
        for encryption in 0..<asciiValues.count {
            var letterNumber = Int(asciiValues[encryption])
            print(letterNumber)
            let range = (letterNumber >= 33 && letterNumber <= 126)
            if range {
                letterNumber += bitMove
                if !(letterNumber >= 33 && letterNumber <= 126) { letterNumber -= 94 } // If range was overextended, it moves back letterNumber, till it will be in range again
            }
            print(letterNumber)
            let transformedLetter = String(UnicodeScalar(UInt8(letterNumber)))
            output += transformedLetter
        }
        return output
    }
    
}
