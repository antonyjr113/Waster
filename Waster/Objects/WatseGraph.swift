//
//  WatseGraph.swift
//  Waster
//
//  Created by Don Wolfton on 15.02.24.
//

import UIKit
import SnapKit

class WasteGraph {
    
    let nameOfGraph: String
    
    init(name: String) {
        self.nameOfGraph = name
    }
    
    let baseValue = 200
    
    let minValue = 10
    
    func createWasteGraph(summ: Int, view: UIView, numberOfGraph: Int) {
        
        let delta = 15
        let width = 45
        
        let height = (summ / 10)
        
        let newTypeView: UIView = {
            let view = UIView()
            view.backgroundColor = .systemRed
            return view
        }()
        view.addSubview(newTypeView)
        newTypeView.snp.makeConstraints { make in
            make.width.equalTo(width)
            make.height.equalTo(height)
            make.centerY.equalTo(view)
            if numberOfGraph == 0 {
                make.leading.equalToSuperview().offset(-15)
            } else {
                make.leading.equalToSuperview().offset((2*delta + width) * numberOfGraph)
            }
        }
        
        let name = UILabel()
        name.text = nameOfGraph
        name.font = UIFont(name: "system", size: 9)
        view.addSubview(name)
        name.snp.makeConstraints { make in
            make.centerX.equalTo(newTypeView)
            make.bottom.equalTo(newTypeView)
        }
        print("waste graph \(nameOfGraph) created")
    }
    
}
