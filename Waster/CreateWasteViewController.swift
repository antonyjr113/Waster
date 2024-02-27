//
//  CreateWateViewController.swift
//  Waster
//
//  Created by Don Wolfton on 14.01.24.
//

import UIKit

class CreateWasteViewController: UIViewController {
    
    @IBOutlet weak var wasteName: UILabel!
    
    @IBOutlet weak var wasteBudget: UILabel!
    
    @IBOutlet weak var enterNameTF: UITextField!
    
    @IBOutlet weak var enterBudgetTF: UITextField!
    
    @IBOutlet weak var saveWasteNameButton: UIButton!
    
    @IBOutlet weak var saveWasteBudgetButton: UIButton!
    
    @IBOutlet weak var showNewWasteButton: UIButton!
    
    @IBOutlet weak var chooseIconView: UIView!
    
    @IBOutlet weak var chooseCarIcon: UIImageView!
    
    @IBOutlet weak var chooseHomeIcon: UIImageView!
    
    @IBOutlet weak var chooseHealthIcon: UIImageView!
    
    @IBOutlet weak var chooseChildIcon: UIImageView!
    
    @IBOutlet weak var chooseSubsIcon: UIImageView!
    
    @IBOutlet weak var chooseJoyIcon: UIImageView!
    
    
    let newWaste = WastePageViewController()
    
    var nameOfIcon = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .themeBG
        
        view.addSubview(chooseIconView)
        chooseIconView.addSubview(chooseCarIcon)
        chooseIconView.addSubview(chooseHomeIcon)
        chooseIconView.addSubview(chooseHealthIcon)
        chooseIconView.addSubview(chooseChildIcon)
        chooseIconView.addSubview(chooseSubsIcon)
        chooseIconView.addSubview(chooseJoyIcon)
        
        let car = Icon(name: "car", view: chooseCarIcon)
        let home = Icon(name: "home", view: chooseHomeIcon)
        let health = Icon(name: "health", view: chooseHealthIcon)
        let child = Icon(name: "child", view: chooseChildIcon)
        let sub = Icon(name: "sub", view: chooseSubsIcon)
        let joy = Icon(name: "joy", view: chooseJoyIcon)
        
        iconsUsedArray.append(car)
        iconsUsedArray.append(home)
        iconsUsedArray.append(health)
        iconsUsedArray.append(child)
        iconsUsedArray.append(sub)
        iconsUsedArray.append(joy)
        
        
        view.addSubview(wasteName)
        wasteName.text = "Enter waste name"
        wasteName.textColor = .texts
        wasteName.backgroundColor = .themeBg
        wasteName.layer.cornerRadius = 30
        
        view.addSubview(wasteBudget) 
        wasteBudget.text = "Enter waste budget"
        wasteBudget.textColor = .texts
        wasteBudget.backgroundColor = .themeBg
        wasteBudget.layer.cornerRadius = 10
        
        view.addSubview(enterNameTF)
        enterNameTF.backgroundColor = .white
        enterNameTF.textColor = .black
        
        view.addSubview(enterBudgetTF)
        enterBudgetTF.backgroundColor = .white
        enterBudgetTF.textColor = .black
        
        view.addSubview(saveWasteNameButton)
        saveWasteNameButton.setTitle("Save", for: .normal)
        
        
        view.addSubview(saveWasteBudgetButton)
        saveWasteBudgetButton.setTitle("Save", for: .normal)
        
        
        view.addSubview(showNewWasteButton)
        showNewWasteButton.setTitle("Add", for: .normal)
        
        showNewWasteButton.tintColor = .systemYellow
        saveWasteNameButton.tintColor = .systemYellow
        saveWasteBudgetButton.tintColor = .systemYellow
        
        tapOnIcon(icon: chooseCarIcon)
        tapOnIcon(icon: chooseHomeIcon)
        tapOnIcon(icon: chooseJoyIcon)
        tapOnIcon(icon: chooseHealthIcon)
        tapOnIcon(icon: chooseChildIcon)
        tapOnIcon(icon: chooseSubsIcon)
        
        print("NUMBER OF ICONS USED = \(userCreatedTypes.count)")
    }
    
    @IBAction func saveNameButtonTap(_ sender: Any) {
        
        if enterNameTF.text == "" {
            let alert = UIAlertController(title: "Name is empty", message: "Enter name of waste at first", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))

            self.present(alert, animated: true)
        } else {
            saveWasteNameButton.tintColor = UIColor.systemGreen
            newWaste.name = enterNameTF.text ?? ""
        }
        print("name \(wasteName.text) saved")
    }
    
    @IBAction func saveBudgetButtonTap(_ sender: Any) {
        
        if enterBudgetTF.text == "" {
 
            let alert = UIAlertController(title: "Budget summ is empty", message: "Enter the summ of budjet please", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))

            self.present(alert, animated: true)
        } else {
            saveWasteBudgetButton.tintColor = UIColor.systemGreen
            newWaste.budget = enterBudgetTF.text ?? ""
        }

        print("budget saved")
    }
    
    @IBAction func addWasteButtonTap(_ sender: Any) {
        
        if newWaste.name == "" || newWaste.budget == "" {
            let alert = UIAlertController(title: "Empty fields", message: "Please, fill Name and Budget fields", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))

            self.present(alert, animated: true)
        }
        else {
            if saveWasteNameButton.tintColor == UIColor.systemGreen && saveWasteBudgetButton.tintColor == UIColor.systemGreen {
                showNewWasteButton.tintColor = UIColor.systemGreen
            }

            let waste = Waste(name: enterNameTF.text, wasteAmount: enterBudgetTF.text, type: nameOfIcon)
            wastesArray.append(waste)
            print("tap added to icon \(nameOfIcon)")
            print("object added to array and it is \(wastesArray.last)")
            self.dismiss(animated: true)
           
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "StatsViewController") as! StatsViewController
            
            present(vc, animated: true)
            showNewWasteButton.tintColor = .systemYellow
            saveWasteNameButton.tintColor = .systemYellow
            saveWasteBudgetButton.tintColor = .systemYellow
            
        }
        
        //print("last added element = ", wastesArray.last)
    }
    
    private func tapOnIcon(icon: UIImageView) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(highlightIcon))
        icon.addGestureRecognizer(tap)
        icon.isUserInteractionEnabled = true
        for element in iconsUsedArray {
            if icon == element.view {
                nameOfIcon = element.name
            }
        }
        
        print("name = \(nameOfIcon)")
        let iconNew = Icon(name: nameOfIcon, view: icon)
        userCreatedTypes.append(iconNew)
        print("new icon in userCreatedicons - ", iconNew.name)
        
        
    }
    @objc func highlightIcon(_sender : UITapGestureRecognizer) {
        let alert = UIAlertController(title: "Done", message: "Icon is chosen!", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))

        self.present(alert, animated: true)
        
        print("icon is chosen")

    }
    
    private func setIconName() {
        name
    }
}
