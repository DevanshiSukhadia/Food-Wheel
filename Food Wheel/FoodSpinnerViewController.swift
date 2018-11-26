//
//  FoodSpinnerViewController.swift
//  Food Wheel
//
//  Created by Devanshi Sukhadia on 11/25/18.
//  Copyright © 2018 San Jose State University. All rights reserved.
//

import UIKit

class FoodSpinnerViewController: UIViewController {

    @IBOutlet weak var Food: UIButton!
    @IBOutlet weak var GreekFood: UIButton!
    
    var greekFoodShuffleButtonCenter: CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()
        greekFoodShuffleButtonCenter = GreekFood.center
        GreekFood.center = Food.center
        // Do any additional setup after loading the view.
    }
    

    @IBAction func FoodClicked(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            //animation
            self.GreekFood.center = self.greekFoodShuffleButtonCenter
        }
    }
    

}
