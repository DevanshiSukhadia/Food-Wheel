//
//  ProfilePageViewController.swift
//  Food Wheel
//
//  Created by Devanshi Sukhadia on 11/28/18.
//  Copyright © 2018 San Jose State University. All rights reserved.
//

import UIKit
import Firebase

class ProfilePageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
 let storage = Storage.storage().reference()
    let databseRef = Database.database().reference()

    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var Name: UILabel!
    
    @IBAction func UploadPicButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(picker, animated: true, completion: nil)
    }
    
    
    @IBAction func Save(_ sender: Any) {
        saveChanges()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProfile()
        

        // Do any additional setup after loading the view.
    }
    
    func setupProfile(){
        profilePic.layer.cornerRadius = profilePic.frame.size.width/3
        profilePic.clipsToBounds = true
        let uid = Auth.auth().currentUser?.uid
        databseRef.child("users").child(uid!).observeSingleEvent(of: .value, with: {(snapshot)
            in
            if let dict = snapshot.value as? [String: AnyObject]
            {
                self.Name.text = dict["name"] as? String
                if let profilePicURL = dict["pic"] as? String
                {
                    let url = URL(string: profilePicURL)
                    URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
                        if error != nil {
                            print(error!)
                            return
                        }
                        DispatchQueue.main.async {
                            self.profilePic.image = UIImage(data: data!)
                        }
                    }).resume()
                }
            }
        })
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var selectedImageFromChoices: UIImage?
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage{
            selectedImageFromChoices = editedImage
        } else if let originalImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
             selectedImageFromChoices = originalImage
        }
        if let selectedImage = selectedImageFromChoices{
            profilePic.image = selectedImage
        }
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func saveChanges(){
        let imageName = NSUUID().uuidString
        
        let storedImage = storage.child("profilePic").child(imageName)
        
        if let uploadData = UIImagePNGRepresentation(self.profilePic.image!){
            storedImage.putData(uploadData, metadata: nil, completion: { (metadata, error) in
                if error != nil {
                    print(error!)
                    return
                }
                storedImage.downloadURL(completion: { (url, error) in
                    if error != nil{
                        print(error!)
                        return
                    }
                    if let urlText = url?.absoluteString{
                        self.databseRef.child("users_pic").child((Auth.auth().currentUser?.uid)!).updateChildValues(["pic" : urlText], withCompletionBlock: { (error, ref) in
                            if error != nil{
                                print(error!)
                                return
                            }
                        })
                    }
                    })
                })
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
}
