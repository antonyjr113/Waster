//
//  UDManager.swift
//  Waster
//
//  Created by Don Wolfton on 17.07.24.
//

import UIKit

class UDManager {
    var key = ""
    
    func saveInUD(object: Any, key: String) {
        UserDefaults.standard.set(object, forKey: key)
    }
    
    func getFromUD(key: String) {
        UserDefaults.standard.object(forKey: key)
    }
    func saveKeyToArray(key: String) {
        keysArray.append(key)
    }
}
