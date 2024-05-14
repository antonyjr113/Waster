//
//  Type.swift
//  Waster
//
//  Created by Don Wolfton on 30.01.24.
//

import UIKit
import SnapKit


class Category {
    
    let baseH = 160
    
    var wasteName = ""
    
    let numberOfColors = colorsStringArray.count
    
    let newTypeView: UIView = {
        let addView = UIView()
        addView.backgroundColor = .systemYellow
        return addView
    }()
    
    let editNewView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemMint
        return view
    }()
    
    private func randomizeColors(n: Int) -> String {
        let color = colorsStringArray[Int.random(in: 0...(colorsStringArray.endIndex - 1))]
        print("res random - ", color)
        return color
        
    }
    
    func createType(onView: UIView, name: String, icon: String) {
        
        var name = name
        let icon = icon
        //name = wasteName
        typesArray.append(newTypeView)
        onView.addSubview(newTypeView)
        newTypeView.backgroundColor = UIColor(named: randomizeColors(n: numberOfColors))

        print("set color = ", newTypeView.backgroundColor)
        newTypeView.snp.makeConstraints { make in
            make.height.equalTo(baseH)
            make.top.equalTo((baseH  + 20)*typesArray.count)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        print("color to set = ", newTypeView.backgroundColor)


        //typesArray.append(newTypeView)
        
        let newTypeStruct = TypeSingle(name: name, color: newTypeView.backgroundColor, icon: icon)
        
        typesArrayStruct.append(newTypeStruct)

        
        let iconIV = UIImageView()
        iconIV.image = UIImage(systemName: "car")
        newTypeView.addSubview(iconIV)
        
        iconIV.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-20)
            make.width.height.equalTo(80)
        }
        
        let typeName = UILabel()
        typeName.text = name
        typeName.font = UIFont(name: "system", size: 30)
        newTypeView.addSubview(typeName)
        
        typeName.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.width.height.equalTo(80)
        }
        
    }
    
    func openEditView(onView: UIView) {
        onView.addSubview(editNewView)
        editNewView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalTo(0)
        }
        editNewView.alpha = 0
        
        UIView.animate(withDuration: 2) {
            self.editNewView.alpha = 1
            self.editNewView.frame.size = CGSize(width: 150, height: 350)
        }
    }

}
