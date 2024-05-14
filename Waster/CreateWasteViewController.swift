//
//  CreateWateViewController.swift
//  Waster
//
//  Created by Don Wolfton on 14.01.24.
//

import UIKit

protocol IconDelegate {
    func transferIcon(icon: Icon)
}

class CreateWasteViewController: UIViewController {
    
    var delegate: IconDelegate?
    
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
    
    var lastTappedTypeIcon: Icon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("CreateWasteViewController opened")
        
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
        
        categoriesArray.append(car)
        categoriesArray.append(home)
        categoriesArray.append(health)
        categoriesArray.append(child)
        categoriesArray.append(sub)
        categoriesArray.append(joy)
        
        
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
        
        
        for element in categoriesArray {
            tapOnIcon(icon: element.view)
        }
        
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
        
        updateAnalytics(arrayWithData: wastesArray)
        
    }
    
    private func tapOnIcon(icon: UIImageView) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(highlightIcon))
        icon.addGestureRecognizer(tap)
        icon.isUserInteractionEnabled = true
    }
    
    @objc func highlightIcon(sender : UITapGestureRecognizer) {
        
        var currentViewTap = sender.view ?? nil
        let alert = UIAlertController(title: "Done", message: "Icon is chosen!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true)
        //currentViewTap = lastTappedTypeIcon
        //currentViewTap = iconForLastWaste
        print("what is tapped = ", sender.view)
        
        for element in categoriesArray {
            if sender.view == element.view {
                print("TRUE = ", element.name)
                nameOfIcon = element.name
                //iconForLastWaste = element.view
                iconForLastWasteGlobal = element.name
                print("for icon for last view = ", iconForLastWasteGlobal)
            } else {
                print("шляпа")
            }
            
        }
        
        //compareViewWithIcons(view: currentViewTap)
        
    }
    
    private func compareViewWithIcons(view: UIView) {
        for element in categoriesArray {
            if view == element.view {
                nameOfIcon = element.name
            }
            print("!!! - ", nameOfIcon)
        }
    }
    
    private func updateAnalytics(arrayWithData: [Waste]) {
        
        var neededKey = "error"
        guard
            let last = arrayWithData.last
        else {
            return
        }
        print(last.name)
        let summ = last.wasteAmount ?? "error"
        print("summ = ", summ)
        let intSumm = Int(summ)!
        print("summ int = ", intSumm)
        
        let name = last.type ?? "error"
        print("name = ", name)
        
        for element in analyticsData {
            if element.key == last.name {
                neededKey = element.key
            }
        }
        analyticsData.updateValue(intSumm, forKey: name)
        print(analyticsData)
    }
    
}
