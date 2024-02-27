//
//  WastePageViewController.swift
//  Waster
//
//  Created by Don Wolfton on 15.01.24.
//

import UIKit

class WastePageViewController: UIViewController {
    
    lazy var name: String = ""
    lazy var budget: String = ""
    lazy var mark: String = ""
    
    
    @IBOutlet weak var nameField: UILabel!
    
    @IBOutlet weak var nameValue: UILabel!
    
    
    @IBOutlet weak var budgetField: UILabel!
    
    @IBOutlet weak var markField: UILabel!
    
    @IBOutlet weak var budgetValue: UILabel!
    
    @IBOutlet weak var markValue: UILabel!
    
    @IBOutlet weak var wasteIconView: UIImageView!
    
    @IBOutlet weak var editBudgetButton: UIButton!
    
    let nameView = UIView()
    //let budgetView = UIView()
    
    let lastWasteView = UIView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .themeBG
        
        view.addSubview(nameField)
        view.addSubview(nameValue)
        view.addSubview(budgetField)
        view.addSubview(budgetValue)
        view.addSubview(markField)
        view.addSubview(markValue)
        view.addSubview(wasteIconView)
        
        nameValue.text = name
        budgetValue.text = budget
        markValue.text = mark
    }
    
    
    @IBAction func editNameButtonTap(_ sender: Any) {
        editFieldValue(field: nameValue)
    }
    
    @IBAction func editBudgetButtonTap(_ sender: Any) {
        editFieldValue(field: budgetValue)
    }
    
    @IBAction func editMarkButtonTap(_ sender: Any) {
        editFieldValue(field: markValue)
    }
    
    
    private func editFieldValue(field: UILabel) {
 
        let alert = UIAlertController(title: "Change value", message: "Enter new value of budget for current waste:", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.text = ""
        }
        
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { [weak alert] (_) in
            let tf = alert?.textFields![0]
            field.text = tf?.text
        }))

        self.present(alert, animated: true)
        
    }

}
