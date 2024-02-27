//
//  SettingsViewController.swift
//  Waster
//
//  Created by Don Wolfton on 17.01.24.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    @IBOutlet weak var touView: UIView!
    
    @IBOutlet weak var touLabel: UILabel!
    
    @IBOutlet weak var ppView: UIView!
    
    @IBOutlet weak var ppLabel: UILabel!
    
    @IBOutlet weak var rateUsView: UIView!
    
    @IBOutlet weak var rateUsLabel: UILabel!
    
    @IBOutlet weak var contactUsView: UIView!
    
    @IBOutlet weak var contactUsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .themeBG
        
        view.addSubview(touView)
        touView.addSubview(touLabel)
        
        
        touView.layer.cornerRadius = 10
        touView.backgroundColor = .systemGreen
        touLabel.textColor = .texts
//        touLabel.font = UIFont(name: "system", size: 21)
        
        view.addSubview(ppView)
        ppView.addSubview(ppLabel)
        
        ppView.layer.cornerRadius = 10
        ppView.backgroundColor = .systemGreen
        ppLabel.textColor = .texts
        
        view.addSubview(rateUsView)
        rateUsView.addSubview(rateUsLabel)
        
        rateUsView.layer.cornerRadius = 10
        rateUsView.backgroundColor = .systemGreen
        rateUsLabel.textColor = .texts
        
        view.addSubview(contactUsView)
        contactUsView.addSubview(contactUsLabel)
        
        contactUsView.layer.cornerRadius = 10
        contactUsView.backgroundColor = .systemGreen
        contactUsLabel.textColor = .texts
    }
    

}
