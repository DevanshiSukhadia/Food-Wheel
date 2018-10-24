//
//  ViewController.swift
//  Food Wheel
//
//  Created by Devanshi Sukhadia on 9/19/18.
//  Copyright © 2018 San Jose State University. All rights reserved.
//

import UIKit
import Firebase
class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.addTarget(self, action: #selector(handleSignIn), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func handleSignIn() {
        guard let email = emailTextField.text else { return }
        guard let pass = passwordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: pass) { (user, error) in
            if error == nil && user != nil {
                print("login")
            } else {
                print("\(error?.localizedDescription)")
            }
        }
    }


}

