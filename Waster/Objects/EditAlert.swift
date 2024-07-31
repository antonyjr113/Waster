//
//  EditAlert.swift
//  Waster
//
//  Created by Don Wolfton on 29.06.24.
//

import UIKit
import SnapKit

final class EditAlert {
    
    var firstField: String?
    var secondField: String?
    var thirdField: String?
    
    init(firstField: String, secondField: String, thirdField: String) {
        self.firstField = firstField
        self.secondField = secondField
        self.thirdField = thirdField
    }
    
    let editAlertView: UIView = {
        let view = UIView()
        view.backgroundColor = .themeBg
        view.layer.cornerRadius = 30
        view.layer.borderWidth = 1
        return view
    }()
    
    let firstOption: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 10
        return button
    }()
    let secondOption: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 10
        return button
    }()
    
    let thirdOption: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 10
        return button
    }()
    
    let closeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        button.setTitle("Close", for: .normal)
        return button
    }()

    func openEditAlert(onView: UIView) {
        onView.addSubview(editAlertView)
        editAlertView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(500)
        }
        editAlertView.addSubview(closeButton)
        closeButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(25)
            make.width.equalTo(75)
        }
        editAlertView.addSubview(firstOption)
        firstOption.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        firstOption.setTitle(firstField, for: .normal)
        editAlertView.addSubview(thirdOption)
        thirdOption.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-100)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        thirdOption.setTitle(thirdField, for: .normal)
        editAlertView.addSubview(secondOption)
        secondOption.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        secondOption.setTitle(secondField, for: .normal)
    }
    
}
