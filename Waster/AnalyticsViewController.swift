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
    var totalOfAll = 0
    var sumsOfTypes = [Int]()
    
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

//        for element in analyticsData {
//            if element.value != 0 {
//                for element in categoriesArray {
//                    createWasteGraphFirst(view: firstGraphView, element: element)
//                    createWasteGraphSecond(view: secondGraphView, element: element)
//                }
//            }
//        }
        for element in analyticsData {
            if element.value != 0 {
                createWasteGraphFirst(view: firstGraphView, element: element.key)
                createWasteGraphSecond(view: secondGraphView, element: element.key)
            }
        }
        
        
    }
    
    private func createWasteGraphFirst(view: UIView, element: String) {
        let delta = 20
        let width = 40
        var height = 0

        print("\ntype: ", element)

        print("COUNTER = ", plusGraphFirst)
        for type in analyticsData {
            if type.key == element {
                height = type.value
                break
            }
        }
        print("height = \(height) for element \(element)")
        print("COUNTER = ", plusGraphFirst)
        
        height = correctHeight(height: height)
        print("height of graph = ", height)
        
        let newTypeView: UIView = {
            let view = UIView()
            view.backgroundColor = ColorRandomizer.shared.randomizeColors()
            return view
        }()
        view.addSubview(newTypeView)
        print("COUNTER = ", plusGraphFirst)
        newTypeView.snp.makeConstraints { make in
            make.width.equalTo(width)
            make.height.equalTo(height)
            make.bottom.equalTo(view).offset(-50)
            if plusGraphFirst == 0 {
                make.leading.equalTo(firstGraphView.bounds.minX).offset(20)
            }
            else {
                make.leading.equalTo(view).offset((delta + width) * plusGraphFirst)
            }
        }
        plusGraphFirst += 1
        let name = UILabel()
        name.text = element
        name.font = UIFont(name: "system", size: 8)
        newTypeView.addSubview(name)
        name.snp.makeConstraints { make in
            make.centerX.equalTo(newTypeView)
            make.bottom.equalTo(newTypeView).offset(20)
        }
        print("analyticsData.count = ", analyticsData.count)
        print("graphCounter = ", plusGraphFirst)

        heightCorrected = 0
        print("COUNTER = ", plusGraphFirst)
    }
    
    
    
    private func createWasteGraphSecond(view: UIView, element: String) {
        let delta = 20
        let width = 40
        var height = 0
        for type in analyticsData {
            totalOfAll += type.value
        }
        print("TOTAL SUMM OF ALL WASTES = ", totalOfAll)
            
        print("\ntype: ", element)

        print("COUNTER = ", plusGraphSecond)
        
        let percentageArray = createPercentageArray()
        
        for type in percentageArray {
            if type.key == element {
                height = type.value
                print("new percentage height for \(element) = \(height)")
                break
            }
        }
        print("height = \(height) for element \(element)")
        //print("COUNTER = ", plusGraphSecond)
        //height = (correctHeight(height: height))
        print("height of graph = ", height)
        
        let newTypeView: UIView = {
            let view = UIView()
            view.backgroundColor = ColorRandomizer.shared.randomizeColors()
            return view
        }()
        view.addSubview(newTypeView)
        print("COUNTER = ", plusGraphSecond)
        newTypeView.snp.makeConstraints { make in
            make.width.equalTo(width)
            make.height.equalTo(height * 2)
            make.bottom.equalTo(view).offset(-50)
            if plusGraphSecond == 0 {
                make.leading.equalTo(firstGraphView.bounds.minX).offset(20)
            }
            else {
                make.leading.equalTo(view).offset((delta + width) * plusGraphSecond)
            }
        }
        plusGraphSecond += 1
        let name = UILabel()
        name.text = element
        name.font = UIFont(name: "system", size: 8)
        newTypeView.addSubview(name)
        name.snp.makeConstraints { make in
            make.centerX.equalTo(newTypeView)
            make.bottom.equalTo(newTypeView).offset(20)
        }
        let percent = UILabel()
        percent.text = String(height)
        percent.font = UIFont(name: "system", size: 8)
        newTypeView.addSubview(percent)
        percent.snp.makeConstraints { make in
            make.centerX.equalTo(newTypeView)
            make.top.equalTo(newTypeView).offset(-20)
        }
        print("analyticsData.count = ", analyticsData.count)
        print("graphCounter = ", plusGraphSecond)
        heightCorrected = 0
        totalOfAll = 0
        print("COUNTER = ", plusGraphSecond)
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
    
    private func countPercentage(typeSumm: Int) -> Int {
        var percentageForType = ((Double(typeSumm) / Double(totalOfAll)) * 100)
        //print("for type = \(typeSumm)/\(totalOfAll) * 100 = ", percentageForType)
        return Int(percentageForType)
    }
    
    private func createPercentageArray() -> [String: Int] {
        var array = analyticsData
        //print("ARRAY FOR 2 FUNC = ", array)
        for element in array {
            //print("\nold value = ", element.value)
            var new = countPercentage(typeSumm: element.value)
            //print("new value = ", new)
            array.updateValue(new, forKey: element.key)
        }
        print("UPDATED ARRAY FOR 2 FUNC = ", array)
        return array
    }
    
}
