//
//  ViewController.swift
//  BitEncryptor
//
//  Created by Kamil on 07/03/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var encrypt = Encrypt()
    
    var encryptionTypeChosen: Int?
    var decrytionChosen: Bool = false
   
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
        print("Startin!")
        let text = inputTextField.text ?? ""
        let encryptedText = encrypt.encrypt(textToEncrypt: text, nameOfEncrytion: UserDefaults.standard.string(forKey: "Name")!, typeOfROTEncrytion: Int(UserDefaults.standard.string(forKey: "Number") ?? ""), decrypt: UserDefaults.standard.bool(forKey: "Decrypt"))
        outputLabel.text = encryptedText
    }
    
}

