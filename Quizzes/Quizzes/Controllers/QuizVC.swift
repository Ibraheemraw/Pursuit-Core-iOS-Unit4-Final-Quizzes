//
//  QuizVC.swift
//  Quizzes
//
//  Created by Ibraheem rawlinson on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizVC: UIViewController {
    let quizView = QuizView()
    var cardSelected: UsersQuizCollection?
    lazy var deleteBttn = UIButton()
    var usersQuizCards = [UsersQuizCollection](){
        didSet{
            self.quizView.quizCollection.reloadData()
             navigationItem.title = "Number of Quizzes (\(usersQuizCards.count))"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(quizView)
        self.title = "Quizzes"
       quizView.quizCollection.delegate = self
        quizView.quizCollection.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        usersQuizCards = UsersQuizCollectionFramework.fetchUsersQuizCollectionFromDocumentsDirectory()
        print("found \(usersQuizCards.count) number of Quizzes)")
    }
//    @objc func options(sender: UIButton, index: Int){
//
//        let actionSheet = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
//        let deleteAction = UIAlertAction.init(title: "Delete", style: .destructive) { (Success) in
//
//            let collection = UsersQuizCollectionFramework.fetchUsersQuizCollectionFromDocumentsDirectory()[index]
//    UsersQuizCollectionFramework.deleteQuizFromUsersQuizCollection(favoriteQuiz: collection, atIndex: sender.tag)
//        }
//        let cacnelAction = UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil)
//        actionSheet.addAction(cacnelAction)
//        actionSheet.addAction(deleteAction)
//        self.present(actionSheet, animated: true, completion: nil)
//    }
    
    
}

extension QuizVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, QuizCellDelegate {
    func deleteQuizCard(index: Int) {
let collection = UsersQuizCollectionFramework.fetchUsersQuizCollectionFromDocumentsDirectory()[index]
        UsersQuizCollectionFramework.deleteQuizFromUsersQuizCollection(favoriteQuiz: collection, atIndex: index)
        self.quizView.quizCollection.reloadData() 

    }
    func presentDeleteAlertController(alertController: UIAlertController) {

        self.present(alertController, animated: true, completion: nil)


    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return usersQuizCards.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuizCell", for: indexPath) as? QuizCell else {
            fatalError("Error in setting up collection view. This is will give a blank generic collection view and not the one you want to use")}
        cell.delegate = self
        let settingCards = usersQuizCards[indexPath.row]
        cell.configureCell(usersCards: settingCards)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let destinationToDetailVC = DetailQuizVC()
        self.navigationController?.pushViewController(destinationToDetailVC, animated: true)
    }
    
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath){
//        deleteBttn = UIButton(frame: CGRect(x:140, y:0, width:50,height:50))
//        deleteBttn.setImage(UIImage.init(named: "icons8-more_filled"), for: .normal)
//        deleteBttn.layer.cornerRadius = 10
//        deleteBttn.backgroundColor = .white
//        deleteBttn.title(for: .normal)
//        deleteBttn.addTarget(self, action: #selector(options), for: .touchUpInside)
//        cell.addSubview(deleteBttn)
//        
//    }
    
    
}
