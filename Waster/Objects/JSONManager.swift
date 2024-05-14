//
//  JSONManager.swift
//  Waster
//
//  Created by Don Wolfton on 29.04.24.
//

import UIKit

class JSONManager {
    
//    let testForWaste = Waste(name: "oil", wasteAmount: "1500", type: "car")
    

    let copyOfWastesArray = wastesArray
    
    func saveData(){
        let test = JSONEncoder()
        test.outputFormatting = .prettyPrinted
        
        do {
            let data = try test.encode(wastesArray)
            print(String(data: data, encoding: .utf8)!)
        }
        catch {
            print("error while saving data")
        }
    }
    
    func exportData() {
        
    }
}

