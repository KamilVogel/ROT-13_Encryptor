//
//  ViewController.swift
//  BitEncryptor
//
//  Created by Kamil on 07/03/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    
    var output = ""
    var bitMove = 13
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        outputLabel.text = output
    }

    @IBAction func textFiledInput(_ sender: UITextField) {
        let textNotEncrypted: String = inputTextField.text!
        let asciiValues = textNotEncrypted.compactMap { $0.asciiValue } // Converts sign into ASCII value
        for encryption in 0..<asciiValues.count {
            
            var letterNumber = Int(asciiValues[encryption])
            
            if (letterNumber >= 65 && letterNumber <= 90){ // upper letters
                letterNumber += bitMove
                while !(letterNumber >= 65 && letterNumber <= 90) { letterNumber -= 26 } // If range was overextended, it moves back letterNumber, till it will be in range again
            }
            else if (letterNumber >= 97 && letterNumber <= 122){ // lower letters
                letterNumber += bitMove
                while !(letterNumber >= 97 && letterNumber <= 122) { letterNumber -= 26 }
            }
            // If sign is e.g. number, it passes unaltered
            let compleatedString = String(UnicodeScalar(UInt8(letterNumber)))
            output += compleatedString
        }
        outputLabel.text = output
        output = ""
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

