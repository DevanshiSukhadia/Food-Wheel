//
//  SuccessViewController.swift
//  Food Wheel
//
//  Created by Ayesha Khan on 11/24/18.
//  Copyright © 2018 San Jose State University. All rights reserved.
//

import UIKit
import Lottie

class SuccessViewController: UIViewController {

    @IBOutlet private var animationView: LOTAnimationView!
    override func viewDidLoad() {
        super.viewDidLoad()
        startAnimation()

    }
    
    @IBAction func enter(_ sender: Any) {
        self.performSegue(withIdentifier: "zipCode", sender: self)

    }
    
    func startAnimation() {
        animationView.setAnimation(named: "data")
        animationView.play()

    }
}
