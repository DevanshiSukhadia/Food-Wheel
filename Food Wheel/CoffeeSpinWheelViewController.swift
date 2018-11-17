//
//  CoffeeSpinWheelViewController.swift
//  Food Wheel
//
//  Created by Nishtha Patel on 11/14/18.
//  Copyright © 2018 San Jose State University. All rights reserved.
//

import UIKit

class CoffeeSpinWheelViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var pickerView: UIPickerView!
    
    let coffeePlaces = ["StarBucks", "Phills Coffee", "Jack in the box", "Cocoa", "McDonalds", "On the fourth", "Caffe Frascati", "B2 Coffee", "Voltaire Coffee House", "Vero's Coffee Bar"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    //returns value in row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return coffeePlaces[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return coffeePlaces.count
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
        let r = Int.random(in: 0 ..< coffeePlaces.count)
        print("This is r: %d", r)
        pickerView.selectRow(r, inComponent: comp, animated: true)
        
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
