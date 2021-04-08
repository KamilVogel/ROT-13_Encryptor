//
//  VarChosen.swift
//  ROT-13_Encryptor
//
//  Created by Kamil on 08/04/2021.
//

import Foundation

//
// Due to having in child view in settings, while turning back button (which is on parent view) I couldn't find a solution w/o using global var
// The only solution w/o global is to use saving button with protocols, and only then I could to safely exit in parent
// If there is solution to this using protocols (or something else) then please let me know, thank you
//

struct VarChosen {
    
    static var name = ""
    static var number: Int? = nil
    static var decrypt = false
    
}
