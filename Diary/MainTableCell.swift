//
//  MainTableCell.swift
//  Diary
//
//  Created by administrator on 14.06.2020.
//  Copyright © 2020 friends. All rights reserved.
//

import UIKit

class MainTableCell: UITableViewCell {
    
    var noteId: UUID?

    @IBOutlet weak var dateLabel: UILabel!
   
    @IBOutlet weak var mainTextLabel: UILabel! 
    
    
    func setup(id: UUID, date: Date, text: String){
        
        noteId = id
        dateLabel.text = Utils.dateToString(date: date)
        dateLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
        
        mainTextLabel.text = text
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
