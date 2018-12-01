//
//  NewConfirmPwdViewController.swift
//  Food Wheel
//
//  Created by Nishtha Patel on 11/30/18.
//  Copyright © 2018 San Jose State University. All rights reserved.
//

import UIKit
import Firebase

class NewConfirmPwdViewController: UIViewController {

    
    @IBOutlet weak var newPassword: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func confirmPassword(_ sender: UIButton) {
        if(newPassword.text != confirmPassword.text) {
            let alertController = UIAlertController(title: "Passwords donot match", message:
                "Retype your passwords", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default,handler: nil))
            self.present(alertController, animated: true, completion: nil)
        } else {
            Auth.auth().currentUser?.updatePassword(to: newPassword.text!) { error in
                if let error = error {
                    print(error._userInfo!["NSLocalizedDescription"] as! String)
                    print("------- Error -------")
                } else {
                    print("------- Update success -------")
                    self.performSegue(withIdentifier: "pwdUpdated", sender: self)
                }
            }
        }
    }
}
