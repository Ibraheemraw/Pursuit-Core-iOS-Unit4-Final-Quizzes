//
//  CreateVC.swift
//  Quizzes
//
//  Created by Ibraheem rawlinson on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CreateVC: UIViewController {
    @IBOutlet weak var titleTextFeildObj: UITextField!
    @IBOutlet weak var factOneDescriptionObj: UITextView!
    @IBOutlet weak var factTwoDescriptionObj: UITextView!
    @IBOutlet weak var CreateQuizitem: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Create A Quiz📝"
        titleTextFeildObj.delegate = self
        factOneDescriptionObj.delegate = self
        factTwoDescriptionObj.delegate = self
        CreateQuizitem.isEnabled = false
        //accessToCreateAQuiz()
    }
    
    private func accessToCreateAQuiz(){
        guard  let title = titleTextFeildObj.text else {
            fatalError("Something wrong when unwrapping values ")
        }
        if title == ""  {
            CreateQuizitem.isEnabled = false
            
        } else {
            CreateQuizitem.isEnabled = true
        }
    }
    private func requiredFillinAlert(){}
    @IBAction func createQuizBttnPressed(_ sender: UIBarButtonItem) {
    }
}

extension CreateVC: UITextFieldDelegate, UITextViewDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
        
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.becomeFirstResponder()
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        accessToCreateAQuiz()
        return true
    }
    func textViewDidChange(_ textView: UITextView) {
        
    }
    
}
