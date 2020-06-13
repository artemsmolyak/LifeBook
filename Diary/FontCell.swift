//
//  FontCell.swift
//  Diary
//
//  Created by Di Gain on 12.06.2020.
//  Copyright © 2020 friends. All rights reserved.
//

import UIKit

class FontCell: UITableViewCell, UITextViewDelegate {
    
    var fontText = UITextView()
    let fontScale = UISlider()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        drawCellLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawCellLayout() {
        fontText.translatesAutoresizingMaskIntoConstraints = false
        fontScale.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(fontText)
        contentView.addSubview(fontScale)
        
        fontText.delegate = self
        
        fontText.text = """
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum.
                        """
        fontText.textAlignment = .justified
        fontText.isScrollEnabled = false
        fontText.font = UIFont.systemFont(ofSize: 10)
        fontText.sizeToFit()
        fontScale.minimumValue = 0
        fontScale.maximumValue = 20
        
        NSLayoutConstraint.activate([
            fontText.topAnchor.constraint(equalTo: self.topAnchor, constant: 2),
            fontText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            fontText.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),

            fontScale.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30),
            fontScale.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            fontScale.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
        
        ])
    }

}
