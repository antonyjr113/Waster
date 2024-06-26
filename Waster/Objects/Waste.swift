//
//  Waste.swift
//  Waster
//
//  Created by Don Wolfton on 25.01.24.
//

import UIKit

struct Waste: Codable {
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

var analyticsData: [String: Int] = [
    "car" : 0,
    "health" : 0,
    "joy": 0,
    "sub" : 0,
    "home" : 0,
    "child" : 0
]

func summariseWastesForType(type: String) {
    for element in wastesArray {
        if element.type == type {
//            switch type {
//            case.car:
//                totalSummforCar += (element.wasteAmount as! NSString).integerValue
//            }
        }
    }
}

