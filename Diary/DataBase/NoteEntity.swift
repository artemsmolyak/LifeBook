//
//  Note.swift
//  Diary
//
//  Created by administrator on 13.06.2020.
//  Copyright © 2020 friends. All rights reserved.
//

import Foundation
 
// Ключи полей по которым происходит сохранение в базе данных
enum KeysForNoteEntity: String{
    case id = "id"
    case text = "text"
    case date = "date"
    case tags = "tag"
}


// Cтруктура, описывающая таблицу Note в базе данных
struct NoteEntity {
    
    var id: UUID
    var date: Date
    var tags: String
    var text: String 
    
    init(date: Date, tags: String, text: String){
        self.id = UUID()
        self.date = date
        self.tags = tags
        self.text = text
    }
    
    init(id: UUID, date: Date, tags: String, text: String){
        self.id = id
        self.date = date
        self.tags = tags
        self.text = text
    }
}
