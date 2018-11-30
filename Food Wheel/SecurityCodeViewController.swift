//
//  SecurityCodeViewController.swift
//  Food Wheel
//
//  Created by Nishtha Patel on 11/26/18.
//  Copyright © 2018 San Jose State University. All rights reserved.
//

import UIKit

class SecurityCodeViewController: UIViewController {
    
    @IBOutlet weak var securityCode: UITextField!
    var myString = String()
    let number = Int.random(in: 100000 ..< 1000000)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let smtpSession = MCOSMTPSession()
        smtpSession.hostname = "smtp.gmail.com"
        smtpSession.username = "foodwheel123@gmail.com"
        smtpSession.password = "devayenis"
        smtpSession.port = 465
        smtpSession.authType = MCOAuthType.saslPlain
        smtpSession.connectionType = MCOConnectionType.TLS
        smtpSession.connectionLogger = {(connectionID, type, data) in
            if data != nil {
                if let string = NSString(data: data!, encoding: String.Encoding.utf8.rawValue){
                    NSLog("Connectionlogger: \(string)")
                }
            }
        }
        let builder = MCOMessageBuilder()
        builder.header.to = [MCOAddress(displayName: "", mailbox: "np1goal@gmail.com")]
        builder.header.from = MCOAddress(displayName: "Food-Wheel", mailbox: "foodwheel123@gmail.com")
        builder.header.subject = "Security Code"
        builder.htmlBody="<p>Your 6 digit code is: </p>" + String(number)
        
        
        let rfc822Data = builder.data()
        let sendOperation = smtpSession.sendOperation(with: rfc822Data)
        sendOperation?.start { (error) -> Void in
            if (error != nil) {
                NSLog("Error sending email: \(error)")
                
                
            } else {
                NSLog("Successfully sent email!")
            }
        }
    }
    
    
    @IBAction func checkSecurityCode(_ sender: UIButton) {
        if(Int(securityCode.text!) != number) {
            let alertController = UIAlertController(title: "Invalid code", message:
                "Please re-enter the correct code", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        } else {
            print("Give here segue")
            performSegue(withIdentifier: "newConfirmPwd", sender: self)
        }
    }
    
    
    
}
