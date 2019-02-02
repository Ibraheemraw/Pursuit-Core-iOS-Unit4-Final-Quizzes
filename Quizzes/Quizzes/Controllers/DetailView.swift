//
//  DetailView.swift
//  Quizzes
//
//  Created by Ibraheem rawlinson on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailView: UIView {
    lazy var detailCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize =  CGSize.init(width: 400, height: 600)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .blue
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
        addSubview(detailCollection)
        detailCollection.register(DetailCell.self, forCellWithReuseIdentifier: "DetailCell")
        setupViews()
    }
    private func setupViews(){
        setupDetailCollectionContraints()
    }
    private func setupDetailCollectionContraints() {
        detailCollection.translatesAutoresizingMaskIntoConstraints = false
        detailCollection.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        detailCollection.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        detailCollection.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        detailCollection.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        
    }
    
    
}
