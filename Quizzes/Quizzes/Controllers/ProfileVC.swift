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
        setupProfileAlert()
        
    }
    

    
    @IBAction func setupUserProfileImage(_ sender: UIButton) {
    }
  private func setupProfileAlert(){
    let alertController = UIAlertController.init(title: "Please Create Your Profile📲", message: "Enter in your username and setup your picture. No spaces or special characters are allowed🙅🏾‍♂️", preferredStyle: .alert)
   let cancel = UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil)
   let submit = UIAlertAction.init(title: "Sumbit", style: .default, handler: { (ProfileCreated) in
    
    })
    alertController.addAction(cancel)
    alertController.addAction(submit)
    self.present(alertController, animated: true, completion: nil)
    }
}
