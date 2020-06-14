//
//  NoteViewController.swift
//  Diary
//
//  Created by administrator on 12.06.2020.
//  Copyright © 2020 friends. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {
    
    var noteId: UUID?
    
    @IBOutlet weak var dateTimeLabel: UILabel!
    
    @IBOutlet weak var tagsLabel: UITextField!
    
    @IBOutlet weak var mainTextLabel: UITextView!
    
    @IBOutlet weak var saveBtn: UIButton!
    
    var delegate: MainControllerDelegate?
    
    func setId(id: UUID){
        noteId = id
    }
     
//    let leftBarButtonItem: UIBarButtonItem = {
//        let barButtonItem = UIBarButtonItem(title: "Left", style: .plain, target: self, action: nil)
//        return barButtonItem
//    }()
    
    
    func getNoteFromDataBase(){
        
        let noteEntity: NoteEntity? = DataBaseWrapper.getNote(id: noteId!)
        
        let date = noteEntity!.date
        dateTimeLabel.text = Utils.dateToString(date: date)
        
        tagsLabel.text = noteEntity?.tags
        mainTextLabel.text = noteEntity?.text
        
    }
    
    
    func setupUi(){
        mainTextLabel.layer.borderWidth = 1.0;
        mainTextLabel.layer.borderColor = UIColor.lightGray.cgColor
        mainTextLabel.layer.cornerRadius = 8;
        
        self.navigationItem.title = "Note"
    }
    
    
    func fillDateToday(){
        dateTimeLabel.text = Utils.dateToString(date: Date())
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUi()

        if noteId == nil {
            fillDateToday()
        }
        else{
            getNoteFromDataBase()
        }
    }
    

    @IBAction func saveBtnPress(_ sender: Any) {
        
        // TO DO пока не учитвается при сохранении
        // let date = dateTimeLabel.text
        let tags = tagsLabel.text
        let text = mainTextLabel.text
        
        
        var noteForSave: NoteEntity?
        
        if noteId == nil {
            
            noteForSave = NoteEntity(date: Date(), tags: tags!, text: text!)
        }
        else{
            noteForSave = NoteEntity(id: noteId!, date: Date(), tags: tags!, text: text!)
        }
 
       DataBaseWrapper.save(noteEntity: noteForSave!)
       delegate?.updateData()
        
       self.navigationController?.popViewController(animated: true)
    }
    

}
