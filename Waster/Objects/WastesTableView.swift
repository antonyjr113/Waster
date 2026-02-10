//
//  WastesTableView.swift
//  Waster
//
//  Created by Don Wolfton on 18.01.25.
//

import SwiftUI

struct WastesTableView: UIViewControllerRepresentable {
    var isExportSelected: Bool
    
    typealias UIViewControllerType = WastesTableViewController
    
    func makeUIViewController(context: Context) -> WastesTableViewController {
        let vc = WastesTableViewController()
        vc.didUpdateExportState(isExportSelected)
        return vc
    }
    
    func updateUIViewController(_ uiViewController: WastesTableViewController, context: Context) {
        uiViewController.didUpdateExportState(isExportSelected)
    }

}

