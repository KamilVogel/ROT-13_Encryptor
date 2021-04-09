//
//  ViewController.swift
//  BitEncryptor
//
//  Created by Kamil on 07/03/2021.
//

import UIKit

class ViewController: UIViewController {

    var rotEncrypt = RotEncrypt()
    
    var encryptionTypeChosen: Int?
    var decrytionChosen: Bool = false
   
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        outputLabel.text = ""
        encryptionTypeChosen = 7
        decrytionChosen = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let title = UserDefaults.standard.string(forKey: "Name")
        titleLabel.text = title
    }

    @IBAction func encrytionSwitch(_ sender: UISwitch) {
        decrytionChosen = !VarChosen.decrypt
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
        let encryptedText = rotEncrypt.encryptROT(textToEncrypt: text, typeOfROTEncrytion: encryptionTypeChosen!, decrypt: decrytionChosen)
        outputLabel.text = encryptedText
    }
    
}

