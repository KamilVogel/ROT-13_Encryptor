//
//  TypeOfEncryptViewController.swift
//  ROT-13_Encryptor
//
//  Created by Kamil on 05/04/2021.
//

import UIKit
import SwiftUI

class TypeOfEncryptViewController: UIViewController {

    @IBOutlet weak var theContainer : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let childView = UIHostingController(rootView: TypeOfEncryptSwiftUIView() )
        addChild(childView)
        childView.view.frame = theContainer.bounds
        theContainer.addSubview(childView.view)
        // Do any additional setup after loading the view.
    }
}
