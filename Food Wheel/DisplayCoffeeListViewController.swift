//
//  DisplayCoffeeListViewController.swift
//  Food Wheel
//
//  Created by Devanshi Sukhadia on 12/2/18.
//  Copyright © 2018 San Jose State University. All rights reserved.
//

import UIKit

class DisplayCoffeeListViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    var stores = [Store]()
    var foodType : String!
    
    
    override func viewDidLoad() {
        print(OptionViewController.cityName)
        super.viewDidLoad()
        execute(apiurl: "https://api.yelp.com/v3/businesses/search?term=coffee&location=san+jose&category=starbucks")
        print(self.stores)
        //        textView.insertText()
    }
    
    
    
    func execute(apiurl: String) {
        var counter = 0
        let accessToken = "AGhwJOMjYxSifwH0Ohcw8Gg23zBd-mFNEqpLZwCs1e1QUyjZC8yU9-BRxfHnQi4_zg2ykGz6wmxE9hzLyIjXZarzQt2VgGWnvjX3sVb_I-zS_7eyO5YkKF8DtL75W3Yx"
        let method = "GET"
        let URL = NSURL(string: apiurl)
        
        // tried setting params to all of the following 4:
        
        let session = URLSession.shared
        let request = NSMutableURLRequest(url: URL as! URL)
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        request.httpMethod = method
        let task = session.dataTask(with: request as URLRequest) {
            (data, response, error) in
            if error == nil {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String:Any]
                    let str = json["businesses"] as! [[String: AnyObject]]
                    
                    for indx in str {
                        let name = indx["name"]! as! String
                        let img_url = indx["image_url"]! as! String
                        var categories = String()
                        let temp1 = indx["categories"] as? [[String: AnyObject]]
                        for indx2  in temp1! {
                            categories +=  indx2["title"]! as! String
                            categories += " "
                        }
                        let rating = indx["rating"]! as! Double
                        let loc = indx["coordinates"] as? NSDictionary
                        let longitude = loc?["longitude"]! as! Double
                        let latitude = loc?["latitude"]! as! Double
                        let d2 = indx["location"] as? NSDictionary
                        let indx3 = d2?["display_address"] as! NSArray
                        let phone = indx["display_phone"]! as! String
                        var address = String()
                        for parts in indx3{
                            
                            address += parts as! String + " "
                        }
                        var txt: String = ""
                        print("++++++++++++++++++++++++++",address)
                        print (longitude,latitude)
                        print(categories,rating)
                        print(name,img_url)
                        txt += "++++++++++++++++++++++++++" + "\n"
                        txt += name + "\n" + address
                        txt += phone + "\n"
                        txt += categories + String(rating) + "\n"
                        //let t = indx["location"] as? NSDictionary
                        //print(t?["address1"])
                        self.textView.text.append(txt)
                        
                        //let newStr = Store(name: name, img_url: img_url, rating: rating, category: categories, longitude: longitude, latitude: latitude, address: address, phone: phone)
                        self.stores.append(Store(name: name, img_url: img_url, rating: rating, category: categories, longitude: longitude, latitude: latitude, address: address, phone: phone))
                        counter += 1
                        
                    }
                print("---------------------------")
                    print(counter)
                }
                catch {
                    
                }
                
            } else {
                print(error)
            }
        }
        task.resume()
   
    }
    
}
