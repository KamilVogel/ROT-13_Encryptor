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
    
    //
    // MARK: Working ROT
    //
    
    
    mutating func encryptROT(textToEncrypt: String, typeOfROTEncrytion bitesToMove: Int = 13, decrypt: Bool = false) -> String {
        
        output = ""
        bitMove = decrypt ? 26 - bitesToMove : bitesToMove // If we need to decrypt we need to do reverse operation to e.g. rot-7 which is 7, we need 19, which can be done by getting value from 26 - 7 which is equal to 19
        let asciiValues = textToEncrypt.compactMap { $0.asciiValue } // Converts sign into ASCII value
        
        for encryption in 0..<asciiValues.count {
            var letterNumber = Int(asciiValues[encryption])
            let range = ((letterNumber >= 65 && letterNumber <= 90) || (letterNumber >= 97 && letterNumber <= 122))
            if range {
                letterNumber += bitMove
                if !((letterNumber >= 65 && letterNumber <= 90) || (letterNumber >= 97 && letterNumber <= 122)) { letterNumber -= 26 } // If range was overextended, it moves back letterNumber, till it will be in range again
            }
            let transformedLetter = String(UnicodeScalar(UInt8(letterNumber)))
            output += transformedLetter
        }
        return output
    }
    
    
    
    //
    // MARK: TO Shorten ROT47
    //
    
    mutating func encryptROT47(textToEncrypt: String, typeOfROTEncrytion bitesToMove: Int = 47, decrypt: Bool = false) -> String {
        
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
