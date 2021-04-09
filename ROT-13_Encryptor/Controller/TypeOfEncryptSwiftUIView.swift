//
//  TypeOfEncryptSwiftUIView.swift
//  ROT-13_Encryptor
//
//  Created by Kamil on 05/04/2021.
//

import SwiftUI

struct TypeOfEncryptSwiftUIView: View {
    
    var encryptionType = TypesEncryption()
    //var varChosen = VarChosen()
    
    @State private var selectedEncryptionTypeIndex: Int = 0
    @State private var enableSwitch = false
    
    @State private var nameChosen = UserDefaults.standard.string(forKey: "Name")
    @State private var numberChosen = UserDefaults.standard.integer(forKey: "Number")
    @State private var decryptChosen = UserDefaults.standard.bool(forKey: "Decrypt")
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    Picker(selection: $selectedEncryptionTypeIndex, label: Text("Selected Encryption")) {
                        ForEach(0 ..< 28) {number in
                            Text(encryptionType.getNameROT(numberIndex: number))
                        }
                    }
                    .onReceive([self.selectedEncryptionTypeIndex].publisher.first(), perform: { _ in
                        UserDefaults.standard.set(encryptionType.getNameROT(numberIndex: selectedEncryptionTypeIndex), forKey: "Name")
                    })
                    Text("Selected \(encryptionType.getNameROT(numberIndex: selectedEncryptionTypeIndex))")
                    Text("\(encryptionType.getNumberOfROT(numberIndex: selectedEncryptionTypeIndex))")
                    Toggle("Enable Decryption", isOn: $enableSwitch)
                    if enableSwitch {
                        Text("Enabled")
                    } else {
                        Text("Disabled")
                    }
                }
            }
            .navigationBarTitle("Settings")
        }
        .onAppear() {
            selectedEncryptionTypeIndex = encryptionType.getIndex(encryptionType: nameChosen ?? "ROT01")
            enableSwitch = decryptChosen
        }
        .onDisappear {
            UserDefaults.standard.set(encryptionType.getNameROT(numberIndex: selectedEncryptionTypeIndex), forKey: "Name")
            UserDefaults.standard.set(encryptionType.getNumberOfROT(numberIndex: selectedEncryptionTypeIndex), forKey: "Number")
            UserDefaults.standard.set(enableSwitch, forKey: "Decrypt")
        }
    }
}




struct TypeOfEncryptSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TypeOfEncryptSwiftUIView()
    }
}
