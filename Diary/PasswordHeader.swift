//
//  PasswordHeader.swift
//  Diary
//
//  Created by Di Gain on 13.06.2020.
//  Copyright © 2020 friends. All rights reserved.
//

import UIKit

class PasswordHeader: UICollectionReusableView, UITextFieldDelegate {
    
    let passwordHeaderText = UILabel()
    var oval1 = UITextField()
    var oval2 = UITextField()
    var oval3 = UITextField()
    var oval4 = UITextField()
    let stackView = UIStackView()
    var dots = [UITextField]()
    
    let numberOfDigits = 4
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        dots = [oval1, oval2, oval3, oval4]
        passwordHeaderText.text = "Enter your code"
        passwordHeaderText.textAlignment = .center
        passwordHeaderText.font = UIFont.systemFont(ofSize: 20)
   
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        
        dots.enumerated().forEach({ (index, field) in
            field.translatesAutoresizingMaskIntoConstraints = false
            field.delegate = self
            field.textAlignment = .center
            field.sizeToFit()
            field.borderStyle = .roundedRect
            field.backgroundColor = .lightGray
//            field.isSecureTextEntry = true
            stackView.addArrangedSubview(field)
        })
        
        dots.first?.becomeFirstResponder()
        
        self.addSubview(passwordHeaderText)
        self.addSubview(stackView)
        
        passwordHeaderText.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
     
        NSLayoutConstraint.activate([
            passwordHeaderText.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -10),
            passwordHeaderText.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant:  -10)
        ])

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return false
    }

}
