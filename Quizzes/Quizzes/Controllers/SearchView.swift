//
//  SearchView.swift
//  Quizzes
//
//  Created by Ibraheem rawlinson on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SearchView: UIView {
    lazy var collectionViewObj: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize =  CGSize.init(width: 350, height: 400)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .brown
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
        addSubview(collectionViewObj)
        collectionViewObj.register(SearchCell.self, forCellWithReuseIdentifier: "SearchCell")
        setupViews()
    }
    private func setupViews(){
        setupFavoriteCollectionViewContraints()
    }
    private func setupFavoriteCollectionViewContraints() {
        collectionViewObj.translatesAutoresizingMaskIntoConstraints = false
        collectionViewObj.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        collectionViewObj.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        collectionViewObj.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionViewObj.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        
    }
}
