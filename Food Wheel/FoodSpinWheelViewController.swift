//
//  FoodSpinWheelViewController.swift
//  Food Wheel
//
//  Created by Nishtha Patel on 11/14/18.
//  Copyright © 2018 San Jose State University. All rights reserved.
//

import UIKit

class FoodSpinWheelViewController: UIViewController {

    
    @IBOutlet weak var pickerView: UIPickerView!
    
    let foodPlaces = ["Mexican", "Indian", "Italian", "Meditaranian", "American", "Thai", "Chinese", "Malaysian", "Mughalai", "Greek"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    //returns the value in row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return foodPlaces[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return foodPlaces.count
    }
    
    
    @IBAction func onClickSpin(_ sender: UIButton) {
        print("checking spin")
        // spin
        roll()
    }
    
    func roll(){ // roll pickerview
        var delay : TimeInterval = 0
        print("rolling starts")
        // iterate over each component, set random img
        for i in 0..<pickerView.numberOfComponents{
            print("inside for loop")
            DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
                print("selecting row")
                self.randomSelectRow(in: i)
            })
            delay += 0.30
        }
    }
    
    // get random number
    func randomSelectRow(in comp : Int){
        print("slecting randome row")
        let r = Int.random(in: 0 ..< foodPlaces.count)
        print("This is r: %d", r)
        pickerView.selectRow(r, inComponent: comp, animated: true)
    }
}
