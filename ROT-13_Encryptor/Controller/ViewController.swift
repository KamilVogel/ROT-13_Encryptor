//
//  ViewController.swift
//  BitEncryptor
//
//  Created by Kamil on 07/03/2021.
//

import UIKit

class ViewController: UIViewController {

    let rotEncrypt = RotEncrypt()
    
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        outputLabel.text = ""
    }

    @IBAction func textFiledInput(_ sender: UITextField) {
        let text = inputTextField.text!
        let encryptedText = rotEncrypt.encryptROT(textToEncrypt: text, decrypt: true)
        outputLabel.text = encryptedText
    }
    @IBAction func encypt(_ sender: UIButton) {
    }
    
    @IBAction func copyToClipboard(_ sender: UIButton) {
        let pasteboard = UIPasteboard.general
        pasteboard.string = outputLabel.text
        let alert = UIAlertController(title: "Success!", message: "Copied to clipboard.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    
}

