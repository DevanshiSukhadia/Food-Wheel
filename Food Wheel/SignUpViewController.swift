//
//  SignUpViewController.swift
//  Food Wheel
//
//  Created by Ayesha Khan on 10/20/18.
//  Copyright © 2018 San Jose State University. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth


class SignUpViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        signUpButton.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        self.hideKeyboard()
    }
    
    @objc func handleSignUp() {
        guard let name = nameTextField.text else { return }
        guard let email = emailTextField.text else { return }
        guard let pass = passwordTextField.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: pass) { (user, error) in
            if error == nil && user != nil {
                print("User created!")
                
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = name
                changeRequest?.commitChanges(completion: { (error) in
                    if error == nil {
                        print("Name Changed")
                        
                        
                    }
                })
                self.performSegue(withIdentifier: "showSuccess", sender: self)
            } else {
                print("Error: \(error!.localizedDescription)")
            }
        }
    }
}
