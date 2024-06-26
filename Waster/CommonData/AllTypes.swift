//
//  Types.swift
//  Waster
//
//  Created by Don Wolfton on 24.01.24.
//

import UIKit

let typesArrayString: [String] = ["car", "home", "health", "children", "subs", "joys"]

//let typesArrayView: [UIView] = [, "home", "health", "children", "subs", "joys"]

var iconsArray = [Icon]()


var typesArray = [UIView]()


struct TypeSingle {
    let name: String?
    let color: UIColor!
    let icon: String?
}

var typesArrayStruct = [TypeSingle]()


struct Icon {
    let name: String
    let view: UIImageView
}


var categoriesArray = [Icon]()

var iconForLastWasteGlobal = ""


enum Icons: String {
    case car
    case health
    case home
    case child
    case joy
    case subs
}

var icon = ""


//switch icon {
//case .car:
//    return "car"
//case .health:
//    return "heart.circle"
//case .joy:
//    return "gamecontroller"
//case .home:
//    return "house"
//case .child:
//    return "figure.arms.open"
//case .subs:
//    return "play.tv.fill"
//}

