//
//  StatsViewController.swift
//  Waster
//
//  Created by Don Wolfton on 17.01.24.
//

import UIKit
import SnapKit

class StatsViewController: UIViewController {
    
    var i = 0
    
    var baseX = 15
    
    var baseY = 100
    
    let delta = 20
    
    var wasteNumber = 0
    
    @IBOutlet weak var wastesTF: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .themeBg
        
        for element in wastesArray {
            addNewWaste(onView: view, element: element)
        }
        
        
    }
    
    private func addNewWaste(onView: UIView, element: Waste) {
        
        let new = UIView(frame: CGRect(x: baseX, y: baseY, width: 365, height: 150))
        onView.addSubview(new)
        new.backgroundColor = .systemCyan
        
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
        icon.text = element.type
        icon.font = UIFont(name: "system", size: 15)
        icon.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(90)
            make.leading.equalToSuperview().offset(15)
            make.width.equalTo(100)
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
}



