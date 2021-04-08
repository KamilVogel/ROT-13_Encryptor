//
//  TypeOfEncryptSwiftUIView.swift
//  ROT-13_Encryptor
//
//  Created by Kamil on 05/04/2021.
//

import SwiftUI

struct TypeOfEncryptSwiftUIView: View {
    
    var encryptionType = TypesEncryption()
    var varChosen = VarChosen()
    
    @State private var selectedEncryptionTypeIndex: Int = 0
    @State private var enableSwitch = false
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    Picker(selection: $selectedEncryptionTypeIndex, label: Text("Selected Encryption")) {
                        ForEach(0 ..< 28) {number in
                            Text(encryptionType.getNameROT(numberIndex: number))
                        }
                    }
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
        .onDisappear {
            VarChosen.name   = encryptionType.getNameROT(numberIndex: selectedEncryptionTypeIndex)
            VarChosen.number = encryptionType.getNumberOfROT(numberIndex: selectedEncryptionTypeIndex)
            VarChosen.decrypt = enableSwitch
        }
    }
}




struct TypeOfEncryptSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TypeOfEncryptSwiftUIView()
    }
}
