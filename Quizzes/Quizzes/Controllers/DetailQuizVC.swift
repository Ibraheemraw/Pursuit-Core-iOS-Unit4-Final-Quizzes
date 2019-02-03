//
//  DetailQuizVC.swift
//  Quizzes
//
//  Created by Ibraheem rawlinson on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailQuizVC: UIViewController {
    let detailView = DetailView()
    let detailCell = DetailCell()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        view.addSubview(detailView)
        detailView.detailCollection.dataSource = self
        detailView.detailCollection.delegate = self
    }
   
}

extension DetailQuizVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCell", for: indexPath) as? DetailCell else {
            fatalError("Was not able to present custom CollectionView")
        }
        guard let card = cell.quizCatergoryLabel.text else {
            fatalError("Error with unwrapping value")
        }
        cell.setFlashCard(card)
    return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! DetailCell
        cell.flip()
        //let flashCard = flashCards[indexPath.row] - get the card the user selected
        /*
         if the card is not flipped {
         call flip function
         } else {
         call the flip back function
         }
         */

    }
    
}
