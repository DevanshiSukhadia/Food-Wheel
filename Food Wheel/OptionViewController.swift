//
//  OptionViewController.swift
//  LoadData
//
//  Created by Ayesha Khan on 11/25/18.
//  Copyright © 2018 Ayesha Khan. All rights reserved.
//

import UIKit

class OptionViewController: UIViewController {
    
    var cityName = String()
    
    @IBOutlet weak var display: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        displayLabel()
        // Do any additional setup after loading the view.
        
    }
    func displayLabel() {
        display.text = "What would you like \n to have in \(cityName)"
        print("What would you like \n to have in \(cityName)")
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
