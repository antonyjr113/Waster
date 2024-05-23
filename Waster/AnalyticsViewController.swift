//
//  AnalyticsViewController.swift
//  Waster
//
//  Created by Don Wolfton on 17.01.24.
//

import UIKit
import SnapKit

class AnalyticsViewController: UIViewController {
    
    var plusGraphFirst = 0
    var plusGraphSecond = 0
    var heightCorrected = 0
    
    let firstGraphView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray2
        return view
    }()
    
    let secondGraphView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        return view
    }()
    
//    let firstGraphStack: UIStackView = {
//        let stack = UIStackView()
//        //stack.spacing = 60
//        stack.axis = .horizontal
//        stack.backgroundColor = .white
//        return stack
//    }()
    
//    let secondGraphStack: UIStackView = {
//        let stack = UIStackView()
//        stack.spacing = 15
//        stack.axis = .horizontal
//        stack.backgroundColor = .white
//        return stack
//    }()
    
    @IBOutlet weak var titleTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("AnalyticsViewController opened")
        view.backgroundColor = .themeBG
        titleTF.textAlignment = .center
        titleTF.isEnabled = false
        titleTF.text = "Your personal analytics"
        titleTF.backgroundColor = .themeBg
        titleTF.font = UIFont(name: "system", size: 32)
        titleTF.borderStyle = .none
        view.addSubview(titleTF)
        
        view.addSubview(firstGraphView)
        firstGraphView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(300)
            make.centerX.equalToSuperview()
            make.top.equalTo(titleTF).offset(30)
        }
        print("firstGraphView created")
        
//        firstGraphView.addSubview(firstGraphStack)
//        firstGraphStack.snp.makeConstraints { make in
//            make.leading.equalToSuperview().offset(10)
//            make.trailing.equalToSuperview().offset(-10)
//            make.height.equalTo(280)
//            make.centerX.equalToSuperview()
//            make.top.equalTo(titleTF).offset(40)
//        }
        
        view.addSubview(secondGraphView)
        secondGraphView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(300)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-65)
        }
        print("secondGraphView created")
        
//        secondGraphView.addSubview(secondGraphStack)
//        secondGraphStack.snp.makeConstraints { make in
//            make.leading.equalToSuperview().offset(10)
//            make.trailing.equalToSuperview().offset(-10)
//            make.height.equalTo(280)
//            make.centerX.equalToSuperview()
//            make.bottom.equalToSuperview().offset(-10)
//        }
        for element in analyticsData {
            if element.value != 0 {
                
            }
        }

        for element in analyticsData {
            if element.value != 0 {
                for element in categoriesArray {
                    plusGraphFirst += 1
                    createWasteGraph(view: firstGraphView, element: element)
                }
                
                for element in categoriesArray {
                    plusGraphSecond += 1
                    createWasteGraph(view: secondGraphView, element: element)
                }
            }
        }
        
        
    }
    
    func createWasteGraph(view: UIView, element: Icon) {
        
        let delta = 20
        let width = 40
        var height = 0
        var counter = 0
        print("\ntype: ", element.name)

        if view == firstGraphView {
            counter = plusGraphFirst
            print("1st graphic")
        } else {
            counter = plusGraphSecond
            print("2nd graphic")
        }

        
        for type in analyticsData {
            if type.key == element.name {
                height = type.value
                break
            }
        }
        print("height = \(height) for element \(element.name)")
        
        
        height = correctHeight(height: height)
        print("height of graph = ", height)
        
        let newTypeView: UIView = {
            let view = UIView()
            view.backgroundColor = ColorRandomizer.shared.randomizeColors()
            return view
        }()
        view.addSubview(newTypeView)
        counter += 1
        
        newTypeView.snp.makeConstraints { make in
            make.width.equalTo(width)
            make.height.equalTo(height)
            make.bottom.equalTo(view).offset(-50)
            if counter == 1 {
                make.leading.equalToSuperview()
            } else {
                make.leading.equalToSuperview().offset((delta + width) * (counter - 1))
            }
        }
        let name = UILabel()
        name.text = element.name
        name.font = UIFont(name: "system", size: 8)
        newTypeView.addSubview(name)
        name.snp.makeConstraints { make in
            make.centerX.equalTo(newTypeView)
            make.bottom.equalTo(newTypeView).offset(20)
        }
        print("analyticsData.count = ", analyticsData.count)
        print("graphCounter = ", counter)
        if counter == analyticsData.count {
            counter = 0
        }
        heightCorrected = 0
        
    }
    
    private func correctHeight(height: Int) -> Int  {
        
        if height > 1000 {
            heightCorrected = height / 100
        } else {
            if height > 100 {
                heightCorrected = height / 10
            }
        }
        return heightCorrected
    }
    
//    func findNeededKey(array: [String : Int], icon: Icon) {
//        for object in analyticsData {
//            if object.key == icon.name {
//                
//            }
//        }
//    }
    
    
}
