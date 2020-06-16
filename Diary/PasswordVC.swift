//
//  PasswordVC.swift
//  Diary
//
//  Created by Di Gain on 13.06.2020.
//  Copyright © 2020 friends. All rights reserved.
//

import UIKit

fileprivate let reuseIdentifier = "CellId"
fileprivate let headerIdentifier = "HeaderId"
fileprivate let backIdentifier = "BackId"

class PasswordVC: UICollectionViewController, UICollectionViewDelegateFlowLayout, UITextFieldDelegate {
    
    let numbers = [
        "1", "2", "3", "4", "5", "6", "7", "8", "9", "", "0", ""
    ]
    let header = PasswordHeader()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: layout)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView!.register(PasswordCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView.register(PasswordHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        self.collectionView.register(BackspaceCell.self, forCellWithReuseIdentifier: backIdentifier)

        self.collectionView.backgroundColor = .white
        collectionView.delaysContentTouches = false
   
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as! PasswordHeader
        return header
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: view.frame.height * 0.3)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbers.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PasswordCell
        cell.digitLabels.text = numbers[indexPath.item]
        if indexPath.item == 9 {
            cell.backgroundColor = .clear
        } else if indexPath.item == 11 {
            let backspaceCell = collectionView.dequeueReusableCell(withReuseIdentifier: backIdentifier, for: indexPath) as! BackspaceCell
            return backspaceCell
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSidePadding = view.frame.width * 0.14
        let interSpacing = view.frame.width * 0.1
        
        let cellSize = (view.frame.width - 2 * screenSidePadding - 2 * interSpacing) / 3
        return .init(width: cellSize, height: cellSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let screenSidePadding = view.frame.width * 0.18
        return .init(top: 16, left: screenSidePadding, bottom: 16, right: screenSidePadding)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    var fourDigitCode = ""
    var taps = 0
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    

    }

    // MARK: UICollectionViewDelegate
  


    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }


}
