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
    var id = 52
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Create A Quiz📝"
        titleTextFeildObj.delegate = self
        factOneDescriptionObj.delegate = self
        factTwoDescriptionObj.delegate = self
        CreateQuizitem.isEnabled = false
        //accessToCreateAQuiz()
    }
    private func hasTextViewBeenFilledIn(){
        guard let factOne = factOneDescriptionObj.text, let factTwo = factTwoDescriptionObj.text else {
            fatalError("Something wrong when unwrapping values")
        }
        switch factOne {
        case "":
            requiredFillinAlert()
            CreateQuizitem.isEnabled = false
        default:
            CreateQuizitem.isEnabled = true
        }
        switch factTwo {
        case "":
            requiredFillinAlert()
            CreateQuizitem.isEnabled = false
        default:
            CreateQuizitem.isEnabled = true
        }
        
    }
    
    private func accessToCreateAQuiz(){
        guard  let title = titleTextFeildObj.text else {
            fatalError("Something wrong when unwrapping values ")
        }
        if title == ""  {
            CreateQuizitem.isEnabled = false
            requiredFillinAlert()
        }
    }
    private func requiredFillinAlert(){
        let alertController = UIAlertController.init(title: "Hey", message: "You have not filled in the 2 facts. Please fill those in to create your Quiz FlashCards", preferredStyle: .alert)
        let okAction = UIAlertAction.init(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    @IBAction func createQuizBttnPressed(_ sender: UIBarButtonItem) {
        guard let title = titleTextFeildObj.text, let factOne = factOneDescriptionObj.text, let factTwo = factTwoDescriptionObj.text else {
            fatalError("textField value is \(String(describing: titleTextFeildObj.text)) first textView value is \(String(describing: factOneDescriptionObj.text)) second textView value is \(String(describing: factTwoDescriptionObj.text))")
        }
        let customQuizCard = UsersQuizCollection.init(title: title, factsOne: factOne, factTwo: factTwo, quizId: String(id))
        UsersQuizCollectionFramework.addQuiz(quiz: customQuizCard)
        id += 1
        print(id)
       
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
        requiredFillinAlert()
        return true
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            hasTextViewBeenFilledIn()
            return false
        }
        return true 
}
}
