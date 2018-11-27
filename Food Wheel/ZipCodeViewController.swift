//
//  ZipCodeViewController.swift
//  LoadData
//
//  Created by Ayesha Khan on 11/25/18.
//  Copyright © 2018 Ayesha Khan. All rights reserved.
//

import UIKit

class ZipCodeViewController: UIViewController {
    @IBOutlet var cityEntered: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as! OptionViewController
//        secondVC.cityName = cityEntered.text!
        OptionViewController.cityName = cityEntered.text
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        if cityEntered.text != "" {
            performSegue(withIdentifier: "toOption", sender: self)
        }
    }
}
