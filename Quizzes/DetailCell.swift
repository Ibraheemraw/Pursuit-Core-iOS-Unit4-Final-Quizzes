//
//  DetailCell.swift
//  Quizzes
//
//  Created by Ibraheem rawlinson on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailCell: UICollectionViewCell {
    lazy var quizCatergoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Category Title"
        label.textColor = .black
        label.backgroundColor = .white
        label.textAlignment = .center
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit(){
        backgroundColor = .white
        layer.cornerRadius = 10
        setupViews()
        
    }
    private func setupViews(){
        setupLabelView()
    }
    private func setupLabelView(){
        addSubview(quizCatergoryLabel)
        quizCatergoryLabel.translatesAutoresizingMaskIntoConstraints = false
        quizCatergoryLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor, constant: 11).isActive = true
        quizCatergoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        quizCatergoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
    }

}
