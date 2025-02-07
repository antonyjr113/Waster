//
//  UserDafaults.swift
//  Waster
//
//  Created by Don Wolfton on 1.12.24.
//

import Foundation

import UIKit

//var isFirstLaunch: Bool {
//    get {
//        if let value = UserDefaults.standard.object(forKey: "isFirstLaunch") as? Bool {
//            return value
//        } else {
//            UserDefaults.standard.set(false, forKey: "isFirstLaunch")
//            return true
//        }
//    }
//    set {
//        UserDefaults.standard.set(false, forKey: "isFirstLaunch")
//    }
//}
let isFirstLaunchApplication: Bool = {
    let isFirstLaunch = UserDefaults.standard.object(forKey: "isFirstLaunch") == nil
    if isFirstLaunch {
        UserDefaults.standard.setValue(true, forKey: "isFirstLaunch")
    }
    return isFirstLaunch
}()
