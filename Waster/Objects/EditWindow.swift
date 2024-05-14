//
//  EditWindow.swift
//  Waster
//
//  Created by Don Wolfton on 3.02.24.
//

import UIKit
import SnapKit

class EditWindow: UIViewController {
    
    let nameForAlert = "name"
    let descForAlert = "description"
    let iconForAlert = "icon"
    
    
    let editNewView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemMint
        view.layer.cornerRadius = 30
        return view
    }()
    
    let name: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemYellow
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        label.text = "Name"
        return label
    }()
    
    let desc: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemIndigo
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        label.text = "Description"
        return label
    }()
    
    let icon: UILabel = {
        let label = UILabel()
        
        label.backgroundColor = .systemGreen
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        label.text = "Icon"
        return label
    }()
    
    let close: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.gray, for: .selected)
        return button
    }()
    
    func setConstraints(onView: UIView) {
        onView.addSubview(editNewView)
        editNewView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(500)
        }
        
        editNewView.addSubview(name)
        name.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        editNewView.addSubview(icon)
        icon.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-100)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        editNewView.addSubview(desc)
        desc.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        editNewView.addSubview(close)
        close.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-15)
            make.top.equalToSuperview().offset(-15)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        
        let tapOnName = UITapGestureRecognizer(target: self, action: #selector(openAlertToType))
        name.addGestureRecognizer(tapOnName)
        name.isUserInteractionEnabled = true
        
        let tapOnIcon = UITapGestureRecognizer(target: self, action: #selector(openAlertToType))
        icon.addGestureRecognizer(tapOnIcon)
        icon.isUserInteractionEnabled = true
        
        let tapOnDesc = UITapGestureRecognizer(target: self, action: #selector(openAlertToType))
        desc.addGestureRecognizer(tapOnDesc)
        desc.isUserInteractionEnabled = true
        
        let closeTap = UITapGestureRecognizer(target: self, action: #selector(closeWindow))
        editNewView.addGestureRecognizer(tapOnDesc)
        editNewView.isUserInteractionEnabled = true
        
        editNewView.alpha = 0
        
        UIView.animate(withDuration: 0.33) {
            self.editNewView.alpha = 1
        }
        
    }
    
    @objc private func openAlertToType() {
        
        let alert = UIAlertController(title: "Enter value", message: "This value will be applied to your new waste:", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.text = ""
        }
        
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { [weak alert] (_) in
            let tf = alert?.textFields![0]
        }))
        
        self.present(alert, animated: true)
    }
    
    @objc private func closeWindow(what: EditWindow) {
        what.dismiss(animated: true)
    }
    
}
