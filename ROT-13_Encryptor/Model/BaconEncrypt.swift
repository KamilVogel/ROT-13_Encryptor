//
//  BaconEncrypt.swift
//  ROT-13_Encryptor
//
//  Created by Kamil on 07/04/2021.
//

import Foundation

struct BaconEncrypt {
    
    var output: String = ""
    let dictionaryOfCypher = ["A": "aaaaa", "B": "aaaab", "C": "aaaba", "D": "aaabb", "E": "aabaa", "F": "aabab", "G": "aabba", "H": "aabbb", "I": "abaaa", "J": "abaab", "K": "ababa", "L": "ababb", "M": "ababb", "N": "abbab", "O": "abbba", "P": "abbbb", "Q": "baaaa", "R": "baaab", "S": "baaba", "T": "baabb", "U": "babaa", "V": "babab", "W": "babba", "X": "babbb", "Y": "bbaaa", "Z": "bbaab","aaaaa": "A", "aaaab": "B", "aaaba": "C", "aaabb": "D", "aabaa": "E", "aabab": "F", "aabba": "G", "aabbb": "H", "abaaa": "I", "abaab": "J", "ababa": "K", "ababb": "L", "abbaa": "M", "abbab": "N", "abbba": "O", "abbbb": "P", "baaaa": "Q", "baaab": "R", "baaba": "S", "baabb": "T", "babaa": "U", "babab": "V", "babba": "W", "babbb": "X", "bbaaa": "Y", "bbaab": "Z"]

    mutating func encryptBacon(textToEncrypt: String, decrypt: Bool) -> String {
    
        output = ""
        let asciiValues = textToEncrypt.uppercased().compactMap { $0 }
        
        // encryption only
        for var encryption in 0..<asciiValues.count {
            let letter = asciiValues[encryption]
            let encrypt = dictionaryOfCypher["\(letter)"] ?? " "
            print(letter)
            print(encrypt)
            output += encrypt
            encryption += 5
        }
        return output
    }
    // Not Working yet correctly
    mutating func dencryptBacon(textToEncrypt: String, decrypt: Bool) -> String {
    
        output = ""
        var divideIntoFiveLetters = 0
        var oneLetter = ""
        let asciiValues = textToEncrypt.lowercased().compactMap { $0 }
        
        // NOT YET WORKING
        for encryption in 0..<asciiValues.count {
            let letter = asciiValues[encryption]
            //print(letter)
            divideIntoFiveLetters += 1
            print("number is \(encryption + 1)")
            if divideIntoFiveLetters % 5 == 0 {
                oneLetter += String(letter)
                let encrypt = dictionaryOfCypher["\(oneLetter)"] ?? " "
                print(encrypt)
                //output += encrypt
                //oneLetter = ""
                //print("Done")
            } else {
                oneLetter += String(letter)
            }
            //output += encrypt // Cannot convert value of type '(UnsafeMutablePointer<Int8>?, Int32) -> Void' to expected argument type 'String'

        }
        return output
    }
    
}
