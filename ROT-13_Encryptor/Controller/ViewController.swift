//
//  ViewController.swift
//  BitEncryptor
//
//  Created by Kamil on 07/03/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var encrypt = Encrypt()
   
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        if UserDefaults.standard.string(forKey: "Name") == nil {
            // Sets default values if it wasnt firstly set
            UserDefaults.standard.set("ROT13", forKey: "Name")
            UserDefaults.standard.set(13, forKey: "Number")
        }
        outputLabel.text = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let title = UserDefaults.standard.string(forKey: "Name")
        titleLabel.text = title
        getTextAndEncrypt()
    }
    
    @IBAction func textFiledInput(_ sender: UITextField) {
        getTextAndEncrypt()
    }
    
    @IBAction func copyToClipboard(_ sender: UIButton) {
        let pasteboard = UIPasteboard.general
        pasteboard.string = outputLabel.text
        let alert = UIAlertController(title: "Success!", message: "Copied to clipboard.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func getTextAndEncrypt() {
        let text = inputTextField.text ?? ""
        let name = UserDefaults.standard.string(forKey: "Name") ?? ""
        let type = UserDefaults.standard.integer(forKey: "Number")
        let decryptSelected = UserDefaults.standard.bool(forKey: "Decrypt")
        let encryptedText = encrypt.encrypt(textToEncrypt: text, nameOfEncrytion: name, typeOfROTEncrytion: type, decrypt: decryptSelected)
        outputLabel.text = encryptedText
    }
    
}

