//
//  WastesManager.swift
//  Waster
//
//  Created by Don Wolfton on 18.06.24.
//

import UIKit

final class WastesManager {
    
    struct Waste: Codable {
        let name: String?
        let summ: String?
        let icon: String?
        let date: String?
    }
    
    
    static var shared: WastesManager =  {
        var totalCar = 0
        var totalHome = 0
        var totalChild = 0
        var totalSubs = 0
        var totalJoy = 0
        var totalHealth = 0
        
        let instance = WastesManager()
        var allWastesArray = [Waste]()
        return instance
        
        func appendWaste(name: String, summ: String, icon: String){
            let newWaste = Waste(name: name, summ: summ, icon: icon, date: DateManager.shared.returnCurrentDate())
            allWastesArray.append(newWaste)
        }
        
        func returnWasteData() -> [Waste] {
            return allWastesArray
        }
//        func returnTotalForCategory(cat: String) {
//            for
//        }
        
    }()
}
