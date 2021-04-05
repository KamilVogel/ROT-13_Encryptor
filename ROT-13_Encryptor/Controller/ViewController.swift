//
//  ViewController.swift
//  BitEncryptor
//
//  Created by Kamil on 07/03/2021.
//

import UIKit

class ViewController: UIViewController {

    let rotEncrypt = RotEncrypt()
    
    var encryptionTypeChosen: Int?
    var decrytionChosen: Bool = false
   
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        outputLabel.text = ""
        encryptionTypeChosen = 7
        decrytionChosen = false
    }

    @IBAction func encrytionSwitch(_ sender: UISwitch) {
        decrytionChosen = !sender.isOn
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
        let encryptedText = rotEncrypt.encryptROT(textToEncrypt: text, typeOfEncrytion: encryptionTypeChosen!, decrypt: decrytionChosen)
        outputLabel.text = encryptedText
    }
    
}

