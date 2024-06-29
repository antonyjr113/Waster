//
//  EditAlert.swift
//  Waster
//
//  Created by Don Wolfton on 29.06.24.
//

import UIKit
import SnapKit

final class EditAlert {
    
    let editAlertView: UIView = {
        let view = UIView()
        view.backgroundColor = .themeBg
        view.layer.cornerRadius = 30
        view.layer.borderWidth = 1
        return view
    }()
    
    let name: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 10
        button.setTitle("Name", for: .normal)
        return button
    }()
    let desc: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 10
        button.setTitle("Description", for: .normal)
        return button
    }()
    
    let icon: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 10
        button.setTitle("Type", for: .normal)
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
        editAlertView.addSubview(name)
        name.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        editAlertView.addSubview(icon)
        icon.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-100)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        editAlertView.addSubview(desc)
        desc.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
    }
    
}
