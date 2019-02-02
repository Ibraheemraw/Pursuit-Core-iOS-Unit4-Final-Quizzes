//
//  SearchCell.swift
//  Quizzes
//
//  Created by Ibraheem rawlinson on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit
protocol SearchCellDelegate: AnyObject {
    func presentAddToQuizCollectionAlert(alertController: UIAlertController)
    func gotoNextViewController(viewController: UIViewController)
}

class SearchCell: UICollectionViewCell {
    weak var delegate: SearchCellDelegate?
    
    lazy var addBttn: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setImage(UIImage.init(named: "icons8-more_filled"), for: .normal)
        button.layer.cornerRadius = 10
        button.setTitleColor(.black, for: .normal)
        button.isEnabled = true
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
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
   @objc private func buttonPressed(){
    guard let textLabel = quizCatergoryLabel.text else {
        print("text label is nil")
        return
    }
       let destinationVC = UIViewController()
       let alertController = UIAlertController.init(title: "Success 🙌🏾", message: "\(textLabel) has been added to your quiz collection📚", preferredStyle: .alert)
    let okAction = UIAlertAction.init(title: "OK", style: .default) { (Success) in
       
        self.delegate?.gotoNextViewController(viewController: destinationVC)
       
    }
    alertController.addAction(okAction)
    self.delegate?.presentAddToQuizCollectionAlert(alertController: alertController)
    
    }
    private func setupViews(){
        setupButtonView()
        setupLabelView()
    }
    private func setupButtonView(){
        addSubview(addBttn)
 addBttn.translatesAutoresizingMaskIntoConstraints = false
        addBttn.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        addBttn.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        addBttn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        addBttn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    private func setupLabelView(){
        addSubview(quizCatergoryLabel)
quizCatergoryLabel.translatesAutoresizingMaskIntoConstraints = false
    quizCatergoryLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor, constant: 11).isActive = true
    quizCatergoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
quizCatergoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
    }

}
