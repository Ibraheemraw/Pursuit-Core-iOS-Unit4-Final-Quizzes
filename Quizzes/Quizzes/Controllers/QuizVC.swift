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
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(quizView)
//        view.backgroundColor = .yellow
        self.title = "Quizzes"
       quizView.quizCollection.delegate = self
        quizView.quizCollection.dataSource = self
    }
    
}

extension QuizVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, QuizCellDelegate {
    func presentDeleteAlertController(alertController: UIAlertController) {
        self.present(alertController, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuizCell", for: indexPath) as? QuizCell else {
            fatalError("Error in setting up collection view. This is will give a blank generic collection view and not the one you want to use")}
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let destinationToDetailVC = DetailQuizVC()
        self.navigationController?.pushViewController(destinationToDetailVC, animated: true)
    }
    
    
}
