//
//  SearchVC.swift
//  Quizzes
//
//  Created by Ibraheem rawlinson on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {

    let searchView = SearchView()
    var onlineQuizCards = [QuizCollection](){
        didSet{
            DispatchQueue.main.async {
                self.searchView.searchColletion.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Search🔍"
        view.addSubview(searchView)
    self.searchView.searchColletion.dataSource = self
    self.searchView.searchColletion.delegate = self
        findQuizCollection()
    }
    
    func findQuizCollection(){
        QuizApiClient.searchForQuizCollection { (appError, onlineQuizCards) in
            if let appError = appError{
                print(appError.errorMessage())
            }
            if let onlineQuizCards = onlineQuizCards {
                // stroring the data into the array
             self.onlineQuizCards = onlineQuizCards
                // test to see if i get data
              //  print("Number of online Quiz Cards \(onlineQuizCards.count)")
            }
        }
    }
    
    
}

extension SearchVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, SearchCellDelegate {
    func presentAddToQuizCollectionAlert(alertController: UIAlertController) {
        //present the view alert controller for the ok action
        self.present(alertController, animated: true, completion: nil)
        
    }
    func gotoNextViewController(viewController: UIViewController) {
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onlineQuizCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCell", for: indexPath) as? SearchCell else {
            fatalError("Error in setting up collection view. This is will give a blank generic collection view and not the one you want to use")}
        cell.delegate = self
        let settingCards = onlineQuizCards[indexPath.row]
        cell.quizCatergoryLabel.text = settingCards.quizTitle
        return cell
    }
}
