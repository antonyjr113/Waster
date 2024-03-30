//
//  Types.swift
//  Waster
//
//  Created by Don Wolfton on 24.01.24.
//

import UIKit

let typesArrayString: [String] = ["car", "home", "health", "children", "subs", "joys"]

var iconsUsedArray = [Icon]()


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

var userCreatedTypes = [Icon]()



