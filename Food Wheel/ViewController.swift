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
        self.hideKeyboard()
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
                self.performSegue(withIdentifier: "successLoginScreen", sender: self)
            } else {
                print("\(error?.localizedDescription)")
            }
        }
    }
        
        @IBAction func signupSegue(_ sender: Any) {
            performSegue(withIdentifier: "signup", sender: self)
        }
    
        @IBAction func forgotPassword(_ sender: UIButton) {
            if(emailTextField.text != "") {
                performSegue(withIdentifier: "forgotPwd", sender: self)
            } else {
                let alertController = UIAlertController(title: "Enter your email", message:
                    "", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default,handler: nil))
                self.present(alertController, animated: true, completion: nil)
            }
        }

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            var securityCodeViewController = segue.destination as? SecurityCodeViewController
            securityCodeViewController?.myString = emailTextField.text!
        }
        


}
extension UIViewController
{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}

