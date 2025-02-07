//
//  WastesTableView.swift
//  Waster
//
//  Created by Don Wolfton on 18.01.25.
//

import SwiftUI

struct WastesTableView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = WastesTableViewController
    
    func makeUIViewController(context: Context) -> WastesTableViewController {
        WastesTableViewController()
    }
    
    func updateUIViewController(_ uiViewController: WastesTableViewController, context: Context) {
        
    }

}

