//
//  WatseGraph.swift
//  Waster
//
//  Created by Don Wolfton on 15.02.24.
//

import UIKit
import SnapKit

class Graph {
    
    let nameOfGraph: String
    var heightOfGraph = 0
    init(name: String) {
        self.nameOfGraph = name
    }
    let baseValue = 200
    let minValue = 10
    var summForCountHeight = 0
    
    func createGraph(summ: Int, view: UIView, numberOfGraph: Int) {
        let delta = 15
        let width = 45
        //let height = (summ / 10)
        let newTypeView: UIView = {
            let view = UIView()
            view.backgroundColor = .systemRed
            return view
        }()
        view.addSubview(newTypeView)
        newTypeView.snp.makeConstraints { make in
            make.width.equalTo(width)
            make.height.equalTo(countHeightOfGraph(totalSumm: 1250))
            make.centerY.equalTo(view)
            if numberOfGraph == 0 {
                make.leading.equalToSuperview().offset(-15)
            }
            else {
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
    
    private func countHeightOfGraph(totalSumm: Int) -> Int{
        var height: Int?
        if totalSumm > 100 {
            height = totalSumm / 5
        }
        else{
            if totalSumm > 1000 {
                height = totalSumm / 20
            }
        }
        height = heightOfGraph
        
        if heightOfGraph == 0 {
            print("error with counting height for \(nameOfGraph)")
        }
        return height ?? 0
    }
//    func updateSumm(array: ) {
//        
//    }
}
