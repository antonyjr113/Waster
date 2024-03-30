//
//  Waste.swift
//  Waster
//
//  Created by Don Wolfton on 25.01.24.
//

import UIKit

struct Waste {
    let name: String?
    let wasteAmount: String?
    let type: String?
}

var wastesArray: [Waste] = []

var totalSummforHealth = 0

var totalSummforHome = 0

var totalSummforJoy = 0

var totalSummforSubs = 0

var totalSummforChild = 0

var totalSummforCar = 0




func updateWasteAmountForType() {
    guard var last = wastesArray.last
    else {
        return
    }
//    switch last.name {
//    case "car" :
//        totalSummforCar += last.wasteAmount?
//    case "home" :
//        totalSummforHome += last.wasteAmount?
//    case "health" :
//        totalSummforHealth += last.wasteAmount?
//    case "joy" :
//        totalSummforJoy += last.wasteAmount?
//    case "subs" :
//        totalSummforSubs += last.wasteAmount?
//    case "child" :
//        totalSummforChild += last.wasteAmount?
//    default:
//        break
//    }
}
