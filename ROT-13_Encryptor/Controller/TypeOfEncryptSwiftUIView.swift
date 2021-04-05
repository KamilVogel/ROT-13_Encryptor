//
//  TypeOfEncryptSwiftUIView.swift
//  ROT-13_Encryptor
//
//  Created by Kamil on 05/04/2021.
//

import SwiftUI

struct TypeOfEncryptSwiftUIView: View {
    
    var encryptionType = ["ROT1", "ROT2", "ROT3", "ROT4", "ROT4", "ROT5", "ROT6", "ROT7", "ROT8", "ROT11","ROT12", "ROT13", "ROT14", "ROT15", "ROT16", "ROT17"]
    @State private var selectedFrameworkIndex: Int = 0
    @State private var enableSwitch: Bool = false
    @State private var key: String = ""
    //@State private var isKeySelected: String = ""
    
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker(selection: $selectedFrameworkIndex, label: Text("Selected Encryption")) {
                        ForEach(0 ..< encryptionType.count) {
                            Text(self.encryptionType[$0])
                        }
                    }
                    Text("Selected \(encryptionType[selectedFrameworkIndex])")
                    Toggle("Enable Decryption", isOn: $enableSwitch)
                    if enableSwitch {
                        Text("Enabled")
                    } else {
                        Text("Disabled")
                    }

                    
                    Picker(selection: $selectedFrameworkIndex, label: Text(keyEntered())) {
                        TextField("Insert Key", text: $key)
                    }
                }
            }
            .navigationBarTitle("Settings")
        }
    }
    
    func keyEntered() -> String {
        if key == "" {
            return "Enter Key"
        } else {
            return "Selected Key: \(key)"
        }
    }

}




struct TypeOfEncryptSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TypeOfEncryptSwiftUIView()
    }
}
