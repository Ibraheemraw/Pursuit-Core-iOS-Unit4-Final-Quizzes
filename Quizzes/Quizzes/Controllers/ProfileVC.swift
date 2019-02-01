//
//  ProfileVC.swift
//  Quizzes
//
//  Created by Ibraheem rawlinson on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    @IBOutlet weak var profileImageObj: UIButton!
    
    @IBOutlet weak var usernameObj: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        getUserDefaultInfo()
        
    }
    

    
    @IBAction func setupUserProfileImage(_ sender: UIButton) {
    }
    private func getUserDefaultInfo(){
        if let profileName = UserDefaults.standard.object(forKey: UserDefaultKeys.userDefaultNameKey) as? String {
            setupProfileAlert()
            self.usernameObj.text = profileName
        } else {
            setupProfileAlert()
        }
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
    }
}
