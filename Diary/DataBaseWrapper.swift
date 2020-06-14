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


class DataBaseWrapper {
    
     
    func save(noteEntity: NoteEntity){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let diaryEntity = NSEntityDescription.entity(forEntityName: "Diary", in: managedContext)!
         
        let diary = NSManagedObject(entity: diaryEntity, insertInto: managedContext)
        
  
        diary.setValue(noteEntity.date, forKeyPath: "date")
        diary.setValue(noteEntity.tags, forKeyPath: "tag")
        diary.setValue(noteEntity.text, forKeyPath: "text")
        
        do{
            try managedContext.save()
        }
        catch let error as NSError{
            print("error")
        }
        
    }
    
    
    
    
}
