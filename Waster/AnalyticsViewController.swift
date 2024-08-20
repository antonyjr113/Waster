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
    let firstGraphViewTitle: UILabel = {
        let label = UILabel()
        return label
    }()
    let secondGraphViewTitle: UILabel = {
        let label = UILabel()
        return label
    }()
    
    @IBOutlet weak var titleLabel: UILabel!
    
    let placeholder = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("AnalyticsViewController opened")
        view.backgroundColor = .themeBG
        view.addSubview(titleLabel)
        titleLabel.textAlignment = .center

        if wastesArray.isEmpty {
            view.addSubview(placeholder)
            placeholder.snp.makeConstraints { make in
                make.centerX.centerY.equalToSuperview()
            }
            placeholder.text = "No wastes"
            placeholder.textAlignment = .center
            placeholder.font = placeholder.font.withSize(25)
            placeholder.textColor = UIColor(named: "systemWhite")
        } else {
            placeholder.removeFromSuperview()
            view.addSubview(firstGraphView)
            firstGraphView.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(10)
                make.trailing.equalToSuperview().offset(-10)
                make.height.equalTo(300)
                make.centerX.equalToSuperview()
                make.top.equalTo(titleLabel).offset(60)
            }
            print("firstGraphView created")
            view.addSubview(secondGraphView)
            secondGraphView.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(10)
                make.trailing.equalToSuperview().offset(-10)
                make.height.equalTo(300)
                make.centerX.equalToSuperview()
                make.bottom.equalToSuperview().offset(-45)
            }
            print("secondGraphView created")
            view.addSubview(firstGraphViewTitle)
            firstGraphViewTitle.snp.makeConstraints { make in
                make.top.equalTo(titleLabel).offset(30)
                make.width.equalToSuperview()
                make.centerX.equalToSuperview()
                make.height.equalTo(30)
            }
            firstGraphViewTitle.text = "Summary of wastes by types, / 1000"
            firstGraphViewTitle.font = UIFont(name: "system", size: 25)
            firstGraphViewTitle.textAlignment = .center
            view.addSubview(secondGraphViewTitle)
            secondGraphViewTitle.snp.makeConstraints { make in
                make.top.equalTo(secondGraphView).offset(-30)
                make.width.equalToSuperview()
                make.centerX.equalToSuperview()
                make.height.equalTo(30)
            }
            secondGraphViewTitle.text = "Percentage by waste types, %"
            secondGraphViewTitle.font = UIFont(name: "system", size: 25)
            secondGraphViewTitle.textAlignment = .center
            for element in analyticsData {
                if element.value != 0 {
                    createWasteGraphFirst(view: firstGraphView, element: element.key)
                    createWasteGraphSecond(view: secondGraphView, element: element.key)
//                    UserDefaults.standard.set(element.value, forKey: element.key)
//                    print("UD KEY for \(element.key) is Created")
                }
            }
        }
    }
    
    private func createWasteGraphFirst(view: UIView, element: String) {
        let delta = 20
        let width = 40
        var height = 0
        var forAmount = 0.0

        print("\ntype: ", element)

        print("COUNTER = ", plusGraphFirst)
        for type in analyticsData {
            if type.key == element {
                height = type.value
                break
            }
        }
        forAmount = Double(height) / 1000
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
                make.leading.equalTo(firstGraphView.bounds.minX).offset(10)
            }
            else if plusGraphFirst == 1 {
                make.leading.equalTo(firstGraphView.bounds.minX).offset(delta + width + 20)
            }
            else {
                make.leading.equalTo(view).offset((delta + width) * plusGraphFirst + 20)
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
        let amount = UILabel()
        amount.text = String(forAmount)
        amount.font = UIFont(name: "system", size: 5)
        newTypeView.addSubview(amount)
        amount.snp.makeConstraints { make in
            make.centerX.equalTo(newTypeView)
            make.top.equalTo(newTypeView).offset(-20)
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
                make.leading.equalTo(secondGraphView.bounds.minX).offset(15)
            }
            else if plusGraphSecond == 1 {
                make.leading.equalTo(secondGraphView.bounds.minX).offset(delta + width + 20)
            }
            else {
                make.leading.equalTo(view).offset((delta + width) * plusGraphSecond + 20)
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
