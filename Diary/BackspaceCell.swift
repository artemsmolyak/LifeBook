//
//  BackspaceCell.swift
//  Diary
//
//  Created by Di Gain on 16.06.2020.
//  Copyright © 2020 friends. All rights reserved.
//

import UIKit

class BackspaceCell: UICollectionViewCell {
    
    let imageView = UIImageView(image: UIImage(named: "gray_back"))
    
    override var isHighlighted: Bool {
        didSet {
            imageView.image = isHighlighted ?  UIImage(named: "green_back") : UIImage(named: "gray_back")
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView.contentMode = .scaleAspectFill
        imageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        addSubview(imageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.center = .init(x: frame.size.width / 2, y: frame.size.height / 2)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
