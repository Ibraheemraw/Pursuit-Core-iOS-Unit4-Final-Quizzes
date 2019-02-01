//
//  SearchCell.swift
//  Quizzes
//
//  Created by Ibraheem rawlinson on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SearchCell: UICollectionViewCell {
    
    
    lazy var addBttn: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Action", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.isEnabled = true
        //3 create target function
        return button
    }()
    lazy var quizCatergoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Best Seller list label"
        label.textColor = .white
        label.backgroundColor = .gray
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
        backgroundColor = .red
        layer.cornerRadius = 10
        setupViews()
    }
    private func setupViews(){
        setupButtonView()
    }
    private func setupButtonView(){
        addSubview(addBttn)
        addBttn.translatesAutoresizingMaskIntoConstraints = false
        addBttn.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        addBttn.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
    }
    private func setupLabelView(){
        
    }

}
