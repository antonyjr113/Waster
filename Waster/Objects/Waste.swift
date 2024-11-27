//
//  Waste.swift
//  Waster
//
//  Created by Don Wolfton on 25.01.24.
//

import UIKit

struct Waste: Codable {
    let name: String
    let wasteAmount: String
    let type: String
    let date: String
}

var lastAmountOfWastes = 0

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

var budgetEntered = "0"

var currencyEntered = ""
var currencyForImage = ""

var keysArray: [String] = []

var dataForMonthStatsArray: [MonthStats] = []

struct MonthStats {
    var month: String?
    var delta: Int?
    let title = "Month "
}

var dataForReportsArray: [Reports] = []

struct Reports {
    //let report: Data?
    let reportDate: String?
    let title = "Report "
    let icon: String?
    let note: String?
}

var reportsArray: [[Reports]] = []

