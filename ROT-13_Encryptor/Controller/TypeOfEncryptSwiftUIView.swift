//
//  TypeOfEncryptSwiftUIView.swift
//  ROT-13_Encryptor
//
//  Created by Kamil on 05/04/2021.
//

import SwiftUI

struct TypeOfEncryptSwiftUIView: View {
    
    var encryptionType = TypesEncryption()
    
    @State private var selectedEncryptionTypeIndex: Int = 0
    @State private var enableSwitch: Bool = false
    @State private var key: String = ""
    //@State private var isKeySelected: String = ""
    
    
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    Picker(selection: $selectedEncryptionTypeIndex, label: Text("Selected Encryption")) {
                        ForEach(0 ..< 28) {number in
                            //Text(encrytpionSelect[$0])
                            Text(encryptionType.getNameROT(numberIndex: number))
                        }
                    }
                    //Text("Selected \(selectedEncryptionTypeIndex)")
                    Text("Selected \(encryptionType.getNameROT(numberIndex: selectedEncryptionTypeIndex))")
                    Text("\(selectedEncryptionTypeIndex)")
                    Toggle("Enable Decryption", isOn: $enableSwitch)
                    if enableSwitch {
                        Text("Enabled")
                    } else {
                        Text("Disabled")
                    }

                    if selectedEncryptionTypeIndex > 26 {
                        Picker(selection: $selectedEncryptionTypeIndex, label: Text(keyEntered())) {
                            TextField("Insert Key", text: $key)
                        }
                    }
                }
            }
            .navigationBarTitle("Settings")
        }
    }
    
    func keyEntered() -> String {
        if key == "" {
            return "Enter Key"
        }
        return "Selected Key: \(key)"
    }

}




struct TypeOfEncryptSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TypeOfEncryptSwiftUIView()
    }
}
