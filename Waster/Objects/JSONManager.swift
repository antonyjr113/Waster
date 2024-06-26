//
//  JSONManager.swift
//  Waster
//
//  Created by Don Wolfton on 29.04.24.
//

import UIKit

class JSONManager {
    
    let copyOfWastesArray = wastesArray
    
    func saveData(){
        let test = JSONEncoder()
        test.outputFormatting = .prettyPrinted
        
        let filePath = self.getDocumentsDirectoryUrl().appendingPathComponent("TEST.json")
        print(filePath)
        
        do {
            let data = try test.encode(wastesArray)
            print(String(data: data, encoding: .utf8)!)
            try data.write(to: filePath)
        }
        catch {
            print("error while saving data")
        }
    }
    

    func getDocumentsDirectoryUrl() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        print("!!!\n", documentsDirectory)
        return documentsDirectory
    }
}

