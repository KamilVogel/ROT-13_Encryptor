//
//  BaconEncrypt.swift
//  ROT-13_Encryptor
//
//  Created by Kamil on 07/04/2021.
//

import Foundation

struct BaconEncrypt {
    
    var output: String = ""
    
    let dictionaryOfCypher = [
        
        "A": "aaaaa",
        "B": "aaaab",
        "C": "aaaba",
        "D": "aaabb",
        "E": "aabaa",
        "F": "aabab",
        "G": "aabba",
        "H": "aabbb",
        "I": "abaaa",
        "J": "abaab",
        "K": "ababa",
        "L": "ababb",
        "M": "abbaa",
        "N": "abbab",
        "O": "abbba",
        "P": "abbbb",
        "Q": "baaaa",
        "R": "baaab",
        "S": "baaba",
        "T": "baabb",
        "U": "babaa",
        "V": "babab",
        "W": "babba",
        "X": "babbb",
        "Y": "bbaaa",
        "Z": "bbaab",
        
        "aaaaa": "A",
        "aaaab": "B",
        "aaaba": "C",
        "aaabb": "D",
        "aabaa": "E",
        "aabab": "F",
        "aabba": "G",
        "aabbb": "H",
        "abaaa": "I",
        "abaab": "J",
        "ababa": "K",
        "ababb": "L",
        "abbaa": "M",
        "abbab": "N",
        "abbba": "O",
        "abbbb": "P",
        "baaaa": "Q",
        "baaab": "R",
        "baaba": "S",
        "baabb": "T",
        "babaa": "U",
        "babab": "V",
        "babba": "W",
        "babbb": "X",
        "bbaaa": "Y",
        "bbaab": "Z"
        
    ]
    
    mutating func encryptBacon(textToEncrypt: String, decrypt: Bool) -> String {
        if decrypt {
            return dencrypt(textToEncrypt: textToEncrypt)
        } else {
            return encrypt(textToEncrypt: textToEncrypt)
        }
    }
    
    mutating func encrypt(textToEncrypt: String) -> String {
    
        output = ""
        let letterArray = textToEncrypt.uppercased().compactMap { $0 }
        
        for var encryption in 0..<letterArray.count {
            let letter = letterArray[encryption]
            if let encrypt = dictionaryOfCypher["\(letter)"] {output += encrypt + " "}
            encryption += 5
        }
        if output != "" {
            output.removeLast()
        }
        return output
    }
    
    mutating func dencrypt(textToEncrypt: String) -> String {
    
        output = ""
        var divideIntoFiveLetters = 0
        var oneLetter = ""
        let letterArray = textToEncrypt.lowercased().compactMap { $0 }
        
        for encryption in 0..<letterArray.count {
            let letter = letterArray[encryption]
            divideIntoFiveLetters += 1
            switch letter {
            case "a", "b":
                if divideIntoFiveLetters % 5 == 0 {
                    oneLetter += String(letter)
                    let encrypt = dictionaryOfCypher["\(oneLetter)"]!
                    output += encrypt
                    oneLetter = ""
                } else {
                    oneLetter += String(letter)
                }
            case " ":
                divideIntoFiveLetters -= 1
            default:
                divideIntoFiveLetters -= 1
                output += String(letter)
            }
        }
        return output
    }
}
