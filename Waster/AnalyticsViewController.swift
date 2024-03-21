//
//  AnalyticsViewController.swift
//  Waster
//
//  Created by Don Wolfton on 17.01.24.
//

import UIKit
import SnapKit

class AnalyticsViewController: UIViewController {
    
    var plusGraph = 0
    
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
        
        //createWasteGraph(summ: 5, stack: firstGraphStack)
        //createWasteGraph(summ: 5, stack: secondGraphStack)
        for element in userCreatedTypes {
            createWasteGraph(summ: 1780, view: firstGraphView, element: element)
        }
        
        for element in userCreatedTypes {
            createWasteGraph(summ: 1780, view: secondGraphView, element: element)
        }
    }
    
    func createWasteGraph(summ: Int, view: UIView, element: Icon) {
        let delta = 20
        let width = 40

        print("plus graph = ", plusGraph)
        let newTypeView: UIView = {
            let view = UIView()
            view.backgroundColor = .systemYellow
            return view
        }()
        view.addSubview(newTypeView)
        plusGraph += 1
        newTypeView.snp.makeConstraints { make in
            make.width.equalTo(width)
            make.height.equalTo(summ/10)
            make.centerY.equalTo(view)
            if plusGraph == 1 {
                make.leading.equalToSuperview().offset(15)
                
            } else {
                make.leading.equalToSuperview().offset((delta + width) * (plusGraph - 1))
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
        if plusGraph == userCreatedTypes.count {
            plusGraph = 0
        }
    }
}
