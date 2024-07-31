//
//  DateManager.swift
//  Waster
//
//  Created by Don Wolfton on 18.06.24.
//

import UIKit

final class DateManager {
    
    static let shared: DateManager = {
        
        let instance = DateManager()
        return instance

    }()
    
    
    func returnCurrentDate() -> String {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "dd-MM-yyyy"
        let currentDate = format.string(from: date)
        return currentDate
    }
    
    func returnCustomDate(date: Date) -> String {
        let customDate = date
        let format = DateFormatter()
        format.dateFormat = "dd-MM-yyyy"
        let customDateConverted = format.string(from: customDate)
        return customDateConverted
    }
    

}
