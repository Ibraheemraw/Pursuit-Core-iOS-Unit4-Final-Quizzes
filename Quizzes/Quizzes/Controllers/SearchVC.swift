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
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(searchView)

    self.searchView.collectionViewObj.dataSource = self
    self.searchView.collectionViewObj.delegate = self
    }
}

extension SearchVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, SearchCellDelegate {
    func presentAddToQuizCollectionAlert(alertController: UIAlertController) {
        self.present(alertController, animated: true, completion: nil)
    
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCell", for: indexPath) as? SearchCell else {
            fatalError("Error in setting up collection view. This is will give a blank generic collection view and not the one you want to use")}
        cell.delegate = self
        return cell
    }
}
