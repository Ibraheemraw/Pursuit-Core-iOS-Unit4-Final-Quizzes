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
        button.backgroundColor = .brown
        button.setTitle("Action", for: .normal)
        button.setTitleColor(.white, for: .normal)
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
       // setupViews()
    }
    private func setupViews(){

    }
    private func setupButtonView(){
        
    }
    private func setupLabelView(){
        
    }

}
