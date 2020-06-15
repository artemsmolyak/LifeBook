//
//  NoteModel.swift
//  Diary
//
//  Created by administrator on 13.06.2020.
//  Copyright © 2020 friends. All rights reserved.
//

import Foundation
import CoreData
import UIKit


// Класс для доступа к базе данных
class DataBaseWrapper { 
    
    static func removeItem(id: UUID){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let diaryEntity = NSFetchRequest<NSFetchRequestResult>(entityName: "Diary")
        
        do{
            
            let result = try managedContext.fetch( diaryEntity )
            for data in result as! [NSManagedObject]{
                let idCheck = data.value(forKey: KeysForNoteEntity.id.rawValue) as! UUID
                
                if idCheck == id{
                    managedContext.delete(data)
                    try managedContext.save()
                }
            }
        }
        catch{
            print("error")
        }
    }
    
    
    
    static func getNote(id: UUID)->NoteEntity?{
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let diaryEntity = NSFetchRequest<NSFetchRequestResult>(entityName: "Diary")
        
        do{
            
            let result = try managedContext.fetch( diaryEntity )
            for data in result as! [NSManagedObject]{
                let idCheck = data.value(forKey: KeysForNoteEntity.id.rawValue) as! UUID
                
                if ( idCheck == id ){
                    let text = data.value(forKey: KeysForNoteEntity.text.rawValue) as! String
                    let date = data.value(forKey: KeysForNoteEntity.date.rawValue) as! Date
                    let tags = data.value(forKey: KeysForNoteEntity.tags.rawValue) as! String
                    
                    return NoteEntity(id: idCheck, date: date, tags: tags, text: text)
                }
            }
        }
        catch{
            print("error")
        }
        
        return nil
    }
    
    
    static func getAll()->[NoteEntity]?{
        
        var noteEntity = [NoteEntity]()
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let diaryEntity = NSFetchRequest<NSFetchRequestResult>(entityName: "Diary")
        
        do{
            
            let result = try managedContext.fetch( diaryEntity )
            
            for data in result as! [NSManagedObject]{
                
                let id = data.value(forKey: KeysForNoteEntity.id.rawValue) as! UUID
                let text = data.value(forKey: KeysForNoteEntity.text.rawValue) as! String
                let date = data.value(forKey: KeysForNoteEntity.date.rawValue) as! Date
                let tags = data.value(forKey: KeysForNoteEntity.tags.rawValue) as! String
                
                let note = NoteEntity(id: id, date: date, tags: tags, text: text)
                noteEntity.append(note)
            }
        }
        catch{
            print("error")
        }
        
        
        return noteEntity
    }
     
     
    static func save(noteEntity: NoteEntity){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let diaryEntity = NSEntityDescription.entity(forEntityName: "Diary", in: managedContext)!
         
        let diary = NSManagedObject(entity: diaryEntity, insertInto: managedContext)
        
        diary.setValue(noteEntity.id, forKeyPath: KeysForNoteEntity.id.rawValue)
        diary.setValue(noteEntity.date, forKeyPath: KeysForNoteEntity.date.rawValue)
        diary.setValue(noteEntity.tags, forKeyPath: KeysForNoteEntity.tags.rawValue)
        diary.setValue(noteEntity.text, forKeyPath: KeysForNoteEntity.text.rawValue)
        
        do{
            try managedContext.save()
        }
        catch let error as NSError{
            print("error")
        }
        
    }
    
    
    
    
}
