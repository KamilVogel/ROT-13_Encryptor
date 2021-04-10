//
//  TypeOfEncryptSwiftUIView.swift
//  ROT-13_Encryptor
//
//  Created by Kamil on 05/04/2021.
//

import SwiftUI

struct TypeOfEncryptSwiftUIView: View {
    
    var typesEncryption = TypesEncryption()
    
    @State private var selectedEncryptionTypeIndex: Int = 0
    @State private var switchText = ""
    @State private var enableSwitch = false {
        didSet { switchText = enableSwitch ? "Decryption enabled" : "Decryption disabled" }
    }
    
    @State private var nameChosen = UserDefaults.standard.string(forKey: "Name")
    @State private var numberChosen = UserDefaults.standard.integer(forKey: "Number")
    @State private var decryptChosen = UserDefaults.standard.bool(forKey: "Decrypt")
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    Picker(selection: $selectedEncryptionTypeIndex, label: Text("Selected Encryption")) {
                        ForEach(0 ..< typesEncryption.encrypt.count) {number in
                            Text(typesEncryption.getNameROT(numberIndex: number))
                        }
                    }
                    .onReceive([self.selectedEncryptionTypeIndex].publisher.first(), perform: { _ in
                        UserDefaults.standard.set(typesEncryption.getNameROT(numberIndex: selectedEncryptionTypeIndex), forKey: "Name")
                        UserDefaults.standard.set(typesEncryption.getNumberOfROT(numberIndex: selectedEncryptionTypeIndex), forKey: "Number")
                    })
                    Toggle(switchText, isOn: $enableSwitch)
                        .onReceive([self.enableSwitch].publisher.first(), perform: {_ in
                            UserDefaults.standard.set(enableSwitch, forKey: "Decrypt")
                            switchText = enableSwitch ? "Decryption enabled" : "Decryption disabled"
                        })
                }
            }
            .navigationBarTitle("Settings")
        }
        .onAppear() {
            selectedEncryptionTypeIndex = typesEncryption.getIndex(encryptionType: nameChosen ?? "ROT01")
            enableSwitch = decryptChosen
        }
    }
}




struct TypeOfEncryptSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TypeOfEncryptSwiftUIView()
    }
}
