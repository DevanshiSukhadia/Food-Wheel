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
    @IBOutlet weak var IndianFood: UIButton!
    @IBOutlet weak var ItalianFood: UIButton!
    @IBOutlet weak var JapaneseFood: UIButton!
    @IBOutlet weak var MexicanFood: UIButton!
    
    var greekFoodShuffleButtonCenter: CGPoint!
    var IndianFoodShuffleButtonCenter: CGPoint!
    var ItalianFoodShuffleButtonCenter: CGPoint!
    var JapaneseFoodShuffleButtonCenter: CGPoint!
    var MexicanFoodShuffleButtonCenter: CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()
        greekFoodShuffleButtonCenter = GreekFood.center
        IndianFoodShuffleButtonCenter = IndianFood.center
        ItalianFoodShuffleButtonCenter = ItalianFood.center
        JapaneseFoodShuffleButtonCenter = JapaneseFood.center
        MexicanFoodShuffleButtonCenter = MexicanFood.center

        GreekFood.center = Food.center
        IndianFood.center = Food.center
        ItalianFood.center = Food.center
        JapaneseFood.center = Food.center
        MexicanFood.center = Food.center
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func FoodClicked(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            //animation
            self.GreekFood.center = self.greekFoodShuffleButtonCenter
            self.IndianFood.center = self.IndianFoodShuffleButtonCenter
            self.ItalianFood.center = self.ItalianFoodShuffleButtonCenter
            self.JapaneseFood.center = self.JapaneseFoodShuffleButtonCenter
            self.MexicanFood.center = self.MexicanFoodShuffleButtonCenter
        }
    }
    

}
