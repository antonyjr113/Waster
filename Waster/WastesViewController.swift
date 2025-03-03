//
//  WastesViewController.swift
//  Waster
//
//  Created by Don Wolfton on 28.01.25.
//

import UIKit
import SwiftUI
import SnapKit

class WastesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let childView = UIHostingController(rootView: WatstesList())
        addChild(childView)
        childView.view.frame = view.bounds
        view.addSubview(childView.view)
        childView.didMove(toParent: self)
        
    }
    //вынести логику сюда из view 
}
