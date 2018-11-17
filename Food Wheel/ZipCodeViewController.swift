//
//  ZipCodeViewController.swift
//  Food Wheel
//
//  Created by Nishtha Patel on 11/14/18.
//  Copyright © 2018 San Jose State University. All rights reserved.
//

import UIKit

class ZipCodeViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var ZipCodeTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ZipCodeTxt.delegate = self;

        // Do any additional setup after loading the view.
    }
    
    //Allows only decimal digits to be entered
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        
        return allowedCharacters.isSuperset(of: characterSet);
    }

    
    //Allows to enter only 5 digits
    //TODO - Does not work, make changes
    @IBAction func ZipCodeLength(_ sender: UITextField) {
        
//        let length = ZipCodeTxt.text?.characters.count
//        let txtInField = ZipCodeTxt.text
//
//        if(length! > 5) {
//            let index = txtInField?.index((txtInField?.startIndex)!, offsetBy: 5)
//            ZipCodeTxt.text = ZipCodeTxt.text?.substring(to: index!)
//        }
    }
}
