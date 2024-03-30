//
//  ColorRandomizer.swift
//  Waster
//
//  Created by Don Wolfton on 30.03.24.
//

import UIKit

class ColorRandomizer {
    
    static var shared: ColorRandomizer =  {
        let instance = ColorRandomizer()
        
        let colors = [greenProperty, redProperty, cyanProperty, indigoProperty, yellowProperty, pinkProperty]
        
        return instance
    }()
    

    
    func randomizeColors() -> UIColor {
        let numberOfColors = (colorsForWastes.count - 1)
        let index = Int.random(in: 0...numberOfColors)
        return colorsForWastes[index]
    }
    
}
