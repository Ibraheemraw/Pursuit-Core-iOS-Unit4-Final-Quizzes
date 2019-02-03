//
//  DetailCell.swift
//  Quizzes
//
//  Created by Ibraheem rawlinson on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailCell: UICollectionViewCell {
    var flashCard: String?
    var isFlipped = false
    
    lazy var quizCatergoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Category Title"
        label.textColor = .black
        label.backgroundColor = .white
        label.textAlignment = .center
        return label
    }()
    lazy var factOneDescription: UITextView = {
        let textView = UITextView()
        textView.text = "Yes You flipped Me"
        return textView
    }()
    lazy var factTwoDescription: UITextView = {
        let textView = UITextView()
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    func setFlashCard(_ flashCard: String){
        //keeps track of card that gets passed in
        self.flashCard = flashCard
        quizCatergoryLabel.text = flashCard
    }
    public func flip(){
        UIView.transition(from: quizCatergoryLabel, to: factOneDescription, duration: 0.3, options: [.transitionFlipFromLeft, .showHideTransitionViews]) { (true) in
            self.addSubview(self.factOneDescription)
            self.factOneDescription.isHidden = false
            self.factOneDescription.text = "Yes You flipped Me"
        }
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
    private func setupFactDescription(){
 factOneDescription.translatesAutoresizingMaskIntoConstraints = false
        factOneDescription.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor, constant: 11).isActive = true
        factOneDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        factOneDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
    }
}
