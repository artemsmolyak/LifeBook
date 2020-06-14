//
//  Utils.swift
//  Diary
//
//  Created by administrator on 14.06.2020.
//  Copyright © 2020 friends. All rights reserved.
//

import Foundation

class Utils{
    
    static func getDateFormatter()->DateFormatter{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter
    }
    
    
    static func dateToString(date: Date)->String?{
        let formatter = getDateFormatter()
        return formatter.string(from: date)
    }
    
    
    static func stringToDate(stringDate: String)->Date?{
        let formatter = getDateFormatter()
        return formatter.date(from: stringDate)
    }
}
