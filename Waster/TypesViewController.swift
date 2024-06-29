//
//  TypesViewController.swift
//  Waster
//
//  Created by Don Wolfton on 23.01.24.
//

import UIKit
import SnapKit

class TypesViewController: UIViewController {
    
    let baseH = 160
    
    let colorsArray = ["systemRed", "systemBlue", "systemGreen", "systemIndigo", "systemMagenta"]
    
    
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
    
    let iconPlus: UIImageView = {
    let icon = UIImageView()
        icon.image = UIImage(systemName: "plus.circle.fill")
    return icon
    }()
    
    let createNewView: UIView = {
        let addView = UIView(frame: CGRect(x: 0, y: 0, width: 330, height: 160))
        addView.backgroundColor = .systemGreen
        addView.layer.cornerRadius = 30
        addView.layer.borderWidth = 1
        addView.layer.borderColor = UIColor.systemGreen.cgColor
    return addView
    }()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("TypesViewController opened")
        
        view.backgroundColor = .themeBg
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(120)
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
        
        contentView.addSubview(createNewView)
        createNewView.snp.makeConstraints { make in
            make.height.equalTo(160)
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        createNewView.addSubview(iconPlus)
        iconPlus.snp.makeConstraints { make in
            make.width.height.equalTo(80)
            make.centerY.centerX.equalToSuperview()
        }
        
        let tapOnCreate = UITapGestureRecognizer(target: self, action: #selector(createNewWasteType))
        createNewView.addGestureRecognizer(tapOnCreate)
        createNewView.isUserInteractionEnabled = true

    }
    
    @objc private func createNewWasteType() {
        
        UIView.animate(withDuration: 0.5) {
            self.createNewView.alpha = 0
        }

        let newType = Category()
        
        newType.openEditView(onView: contentView)
        
//        editWasteType(wt: newType)
//        newType.newTypeView.backgroundColor = .systemCyan
//        newType.createType(onView: contentView, name: "CAR" , icon: "ICON")
        
    }
    
    private func generateType(n: Int) {

        for i in 1...n {
            let newTypeView: UIView = {
                let addView = UIView()
                addView.backgroundColor = .systemYellow
                return addView
            }()
            contentView.addSubview(newTypeView)
            newTypeView.snp.makeConstraints { make in
                make.height.equalTo(baseH)
                make.top.equalTo(baseH * i + 20 * i)
                make.leading.equalToSuperview().offset(20)
                make.trailing.equalToSuperview().offset(-20)
            }
            typesArray.append(newTypeView)

        }
        
    }
    
    private func editWasteType(wt: Category) {

        let alert = UIAlertController(title: "Enter new type name", message: "You are to enter the neame of your personal waste type :", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.text = ""
        }
        
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { [weak alert] (_) in
            let tf = alert?.textFields![0]
            wt.wasteName = tf?.text ?? "error"
        }))

        self.present(alert, animated: true)
        
    }
    
}
