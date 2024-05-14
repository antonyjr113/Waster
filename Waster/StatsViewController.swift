//
//  StatsViewController.swift
//  Waster
//
//  Created by Don Wolfton on 17.01.24.
//

import UIKit
import SnapKit


class StatsViewController: UIViewController, IconDelegate {
    
    func transferIcon(icon: Icon) {
        iconForLastWaste = icon
    }
    
    var i = 0
    
    var baseX = 15
    
    var baseY = 0
    
    let delta = 20
    
    var iconForLastWaste: Icon?
    
    //var delegate: IconDelegate?
    
    var wasteNumber = wastesArray.count
    
    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .themeBg
        return scroll
    }()
    
    let contentView: UIView = {
    let addView = UIView()
        addView.backgroundColor = .themeBg
    return addView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("StatsViewController opened")
        
        view.backgroundColor = .themeBg
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(90)
            $0.bottom.equalToSuperview().offset(-50)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.top)
            $0.bottom.equalTo(scrollView.snp.bottom)
            $0.leading.equalTo(scrollView.snp.leading)
            $0.trailing.equalTo(scrollView.snp.trailing)
            
            $0.width.equalTo(scrollView)
            $0.height.equalTo(scrollView).multipliedBy(2)
        }
        baseY = Int(contentView.frame.minY)
        
        for element in wastesArray {
            addNewWaste(onView: contentView, element: element)
        }
        
        let allWastesData = JSONManager()
        allWastesData.saveData()
        
//        guard let lastAddedElement = wastesArray.last else {
//            return
//            print("no element in wastes array")
//        }
//        addNewWaste(onView: view, element: lastAddedElement)
    }
    
    private func addNewWaste(onView: UIView, element: Waste) {
        
        let new = UIView(frame: CGRect(x: baseX, y: baseY, width: 365, height: 150))
        onView.addSubview(new)
        let backForView = ColorRandomizer.shared.randomizeColors()
        new.backgroundColor = backForView
        
        let name = UILabel()
        new.addSubview(name)
        name.text = element.name
        print(name)
        name.font = UIFont(name: "system", size: 15)
        name.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.leading.equalToSuperview().offset(15)
            make.width.equalTo(100)
            make.height.equalTo(20)
        }
        
        let summ = UILabel()
        new.addSubview(summ)
        summ.text = element.wasteAmount
        summ.font = UIFont(name: "system", size: 15)
        summ.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.leading.equalToSuperview().offset(15)
            make.width.equalTo(100)
        }
        
        let icon = UILabel()
        new.addSubview(icon)
        //icon.text = iconForLastWaste?.name ?? "error"
        var iconName = wastesArray.last?.type ?? "error 2"
        icon.text = iconName
        
        let whatChosen = IconsTapped.RawValue.self
        print("!!!!!! - ", whatChosen)
        
        
        icon.font = UIFont(name: "system", size: 15)
        icon.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(90)
            make.leading.equalToSuperview().offset(15)
            make.width.equalTo(100)
        }
        

        var iconView = UIImageView()
//        iconView = iconForLastWaste?.view ?? UIImageView(image: UIImage(named: "car"))
        new.addSubview(iconView)
//        iconView.backgroundColor = .themeBg
        iconView.image = UIImage(systemName: "heart.circle")
        iconView.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.width.height.equalTo(70)
        }
        
        let dateLabel = UILabel()
        new.addSubview(dateLabel)
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "dd-MM-yyyy"
        dateLabel.text = format.string(from: date)
        dateLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.width.equalTo(100)
        }
        baseY+=180
    }
    
    private func randomizeColors() -> UIColor {
        let numberOfColors = (colorsForWastes.count - 1)
        let index = Int.random(in: 0...numberOfColors)
        return colorsForWastes[index]
    }
}



