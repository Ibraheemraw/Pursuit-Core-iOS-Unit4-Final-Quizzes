//
//  QuizCell.swift
//  Quizzes
//
//  Created by Ibraheem rawlinson on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit
protocol QuizCellDelegate: AnyObject {
    func presentDeleteAlertController(alertController: UIAlertController)
    func deleteQuizCard(index: Int)
}

class QuizCell: UICollectionViewCell {
   weak var delegate: QuizCellDelegate?
    
    
    lazy var deleteBttn: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setImage(UIImage.init(named: "icons8-more_filled"), for: .normal)
        button.layer.cornerRadius = 10
        button.setTitleColor(.black, for: .normal)
        button.isEnabled = true
       button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    lazy var quizCatergoryTitle: UILabel = {
        let label = UILabel()
        label.text = "Category Title"
        label.textColor = .black
        label.backgroundColor = .white
        label.textAlignment = .center
        label.numberOfLines = 3
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        buttonPressed()
        
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
    public func configureCell(usersCards: UsersQuizCollection){
        quizCatergoryTitle.text = usersCards.title
    }
    @objc private func buttonPressed(){
        
        let actionSheet = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
        let deleteAction = UIAlertAction.init(title: "Delete", style: .destructive) { (Success) in
             self.delegate?.deleteQuizCard(index: self.deleteBttn.tag)
        }
        let cacnelAction = UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil)
        actionSheet.addAction(cacnelAction)
        actionSheet.addAction(deleteAction)
       self.delegate?.presentDeleteAlertController(alertController: actionSheet)
        func deleteCard(indexPath: IndexPath) {
          
        }
    }
    
    private func setupViews(){
        setupButtonView()
        setupLabelView()
    }
    private func setupButtonView(){
        addSubview(deleteBttn)
        deleteBttn.translatesAutoresizingMaskIntoConstraints = false
        deleteBttn.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        deleteBttn.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        deleteBttn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        deleteBttn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    private func setupLabelView(){
        addSubview(quizCatergoryTitle)
        quizCatergoryTitle.translatesAutoresizingMaskIntoConstraints = false
        quizCatergoryTitle.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor, constant: 11).isActive = true
        quizCatergoryTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        quizCatergoryTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
    }
}
