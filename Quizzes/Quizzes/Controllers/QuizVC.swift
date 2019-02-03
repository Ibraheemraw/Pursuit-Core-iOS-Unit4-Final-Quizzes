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
    
}

extension QuizVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, QuizCellDelegate {
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
    
    
}
