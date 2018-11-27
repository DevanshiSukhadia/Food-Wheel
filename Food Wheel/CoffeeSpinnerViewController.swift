//
//  CoffeeSpinnerViewController.swift
//  Food Wheel
//
//  Created by Devanshi Sukhadia on 11/25/18.
//  Copyright © 2018 San Jose State University. All rights reserved.
//

import UIKit

class CoffeeSpinnerViewController: UIViewController {
    var city: String!
    @IBOutlet weak var Peets: UIButton!
    @IBOutlet weak var Starbucks: UIButton!
    @IBOutlet weak var Philz: UIButton!
    @IBOutlet weak var coffee: UIButton!
    
    var PeetsFoodShuffleButtonCenter: CGPoint!
    var StarbucksFoodShuffleButtonCenter: CGPoint!
    var PhilzFoodShuffleButtonCenter: CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()
        PeetsFoodShuffleButtonCenter = Peets.center
        StarbucksFoodShuffleButtonCenter = Starbucks.center
        PhilzFoodShuffleButtonCenter = Philz.center
        
        Peets.center = coffee.center
        Starbucks.center = coffee.center
        Philz.center = coffee.center
        // Do any additional setup after loading the view.
    }
    

    @IBAction func click(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.Peets.center = self.PeetsFoodShuffleButtonCenter
            self.Starbucks.center = self.StarbucksFoodShuffleButtonCenter
            self.Philz.center = self.PhilzFoodShuffleButtonCenter
        }
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
