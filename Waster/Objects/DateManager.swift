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
    
    
    func returnDate() -> String {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "dd-MM-yyyy"
        let currentDate = format.string(from: date)
        return currentDate
    }
    

}
