//
//  ProfileVC.swift
//  Quizzes
//
//  Created by Ibraheem rawlinson on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit
import AVFoundation

class ProfileVC: UIViewController {
    @IBOutlet weak var photoLibraryBttn: UIButton!
    
    @IBOutlet weak var profileImageObj: UIImageView!
    @IBOutlet weak var usernameObj: UILabel!
    private var imagePickerController: UIImagePickerController!
    override func viewDidLoad() {
        super.viewDidLoad()
        getUserDefaultInfo()
        profileImageObj.contentMode = .scaleAspectFit
        
    }
    // this function is for when you want to disable the camera if the user does not have a camera on their phone: setupImagePickerController()
    private func showImagePickerController() {
        present(imagePickerController, animated: true, completion: nil)
    }
    @IBAction func setupUserProfileImage(_ sender: UIButton) {
        let actionSheet = UIAlertController.init(title: "Setup Profile Picture", message: "Select your photo library📲 to add a piture🌄", preferredStyle: .actionSheet)
        let photoLibrary = UIAlertAction.init(title: "Photo Library", style: .default) { (Success) in
            self.imagePickerController = UIImagePickerController()
            self.imagePickerController.delegate = self
            self.imagePickerController.sourceType = .photoLibrary
            self.showImagePickerController()
        }
        let cancel = UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil)
        actionSheet.addAction(photoLibrary)
        actionSheet.addAction(cancel)
        self.present(actionSheet, animated: true, completion: nil)
    }
    private func getUserDefaultInfo(){
        if let profileName = UserDefaults.standard.object(forKey: UserDefaultKeys.userDefaultNameKey) as? String {
            setupProfileAlert()
            self.usernameObj.text = profileName
        } else {
            setupProfileAlert()
        }
//        if let profilePicture = UserDefaults.standard.object(forKey: UserDefaultKeys.userDefaultPicturekey) as? UIImage {
//            self.profileImageObj.image = profilePicture
//        } else {
//           print("No image has been set for the profile picture")
//        }
    }
    
  private func setupProfileAlert(){
    let alertController = UIAlertController.init(title: "Please Create Your Profile📲", message: "Enter in your username and setup your picture. No spaces or special characters are allowed🙅🏾‍♂️", preferredStyle: .alert)
   let cancel = UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil)
   let submit = UIAlertAction.init(title: "Sumbit", style: .default, handler: { (ProfileCreated) in
    guard let username = alertController.textFields?.first?.text else {
        print("alertController textfield is nil")
        return
    }
    let profileName = "@\(username)"
    self.usernameObj.text = profileName
    
    UserDefaults.standard.set(profileName, forKey: UserDefaultKeys.userDefaultNameKey)
    
    })
    alertController.addTextField { (textfield) in
        textfield.placeholder = "enter in a username for your profile"
        textfield.textAlignment = .center
    }
    alertController.addAction(cancel)
    alertController.addAction(submit)
    doneAlert()
    if usernameObj.text == nil || usernameObj.text == "" {
        self.present(alertController, animated: true, completion: nil)
    }
    }
    private func doneAlert(){
        let alertController = UIAlertController.init(title: "Success 🕺🏾", message: "You have created your user name. Now Please add an image 🤳🏾 to your profile", preferredStyle: .alert)
        let doneBttn = UIAlertAction.init(title: "Done", style: .cancel, handler: nil)
        alertController.addAction(doneBttn)
        present(alertController, animated: true, completion: nil)
    }
}

extension ProfileVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("\ninfo: \(info)\n") // keys: UIImagePickerController.InfoKey.originalImage
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            print("no image found")
            return
        }
        profileImageObj.image = image
//        UserDefaults.standard.set(image, forKey: UserDefaultKeys.userDefaultPicturekey)
        dismiss(animated: true, completion: nil)
    }
}
