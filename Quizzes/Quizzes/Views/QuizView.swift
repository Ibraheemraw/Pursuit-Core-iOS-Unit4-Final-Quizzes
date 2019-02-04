//
//  QuizView.swift
//  Quizzes
//
//  Created by Ibraheem rawlinson on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizView: UIView {
    lazy var quizCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize =  CGSize.init(width: 190, height: 400)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .yellow
        return collectionView
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit(){
        backgroundColor = .white
        addSubview(quizCollection)
        quizCollection.register(QuizCell.self, forCellWithReuseIdentifier: "QuizCell")
    
        setupViews()
    }
    private func setupViews(){
        setupQuizCollectionContraints()
    }
    private func setupQuizCollectionContraints() {
        quizCollection.translatesAutoresizingMaskIntoConstraints = false
        quizCollection.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        quizCollection.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        quizCollection.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        quizCollection.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        
    }
    
}
