//
//  PasswordCell.swift
//  Diary
//
//  Created by Di Gain on 13.06.2020.
//  Copyright © 2020 friends. All rights reserved.
//

import UIKit

class PasswordCell: UICollectionViewCell {
    
    let digitLabels = UILabel()
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.green : UIColor(white: 0.9, alpha: 1)
            digitLabels.font = isHighlighted ? .boldSystemFont(ofSize: frame.width / 2.5) : UIFont.systemFont(ofSize: frame.width / 2.5)
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(white: 0.9, alpha: 1)
        
        digitLabels.font = UIFont.systemFont(ofSize: frame.width / 2.5)
        digitLabels.textAlignment = .center
        
        contentView.addSubview(digitLabels)
        
        digitLabels.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            digitLabels.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            digitLabels.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = self.frame.width / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
