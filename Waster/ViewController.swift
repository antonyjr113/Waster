//
//  ViewController.swift
//  Waster
//
//  Created by Don Wolfton on 3.01.24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var addWasteButton: UIButton!
    
    @IBOutlet weak var personalPageView: UIView!
    
    @IBOutlet weak var persPageIcon: UIImageView!
    
    @IBOutlet weak var personalStatsView: UIView!
    
    @IBOutlet weak var statsIcon: UIImageView!
    
    @IBOutlet weak var analyticsView: UIView!
    
    @IBOutlet weak var analyticsIcon: UIImageView!
    
    @IBOutlet weak var settingsView: UIView!
    
    @IBOutlet weak var settingsIcon: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .themeBG
        addWasteButton.tintColor = .systemGreen
        
        view.addSubview(personalPageView)
        view.addSubview(personalStatsView)
        view.addSubview(analyticsView)
        view.addSubview(settingsView)
        
        personalPageView.layer.cornerRadius = 30
        personalPageView.layer.shadowColor = UIColor.shadow.cgColor
        personalPageView.layer.shadowOpacity = 5
        personalPageView.addSubview(persPageIcon)
        
        personalStatsView.layer.cornerRadius = 30
        personalStatsView.addSubview(statsIcon)
        
        analyticsView.layer.cornerRadius = 30
        analyticsView.addSubview(analyticsIcon)
        
        settingsView.layer.cornerRadius = 30
        settingsView.addSubview(settingsIcon)
            
        let tapOnPersPage = UITapGestureRecognizer(target: self, action: #selector(openPersonalPage))
        personalPageView.addGestureRecognizer(tapOnPersPage)
        personalPageView.isUserInteractionEnabled = true
        
        let tapOnStatsPage = UITapGestureRecognizer(target: self, action: #selector(openStatsPage))
        personalStatsView.addGestureRecognizer(tapOnStatsPage)
        personalStatsView.isUserInteractionEnabled = true
        
        let tapOnAnalyticsView = UITapGestureRecognizer(target: self, action: #selector(openAnalytics))
        analyticsView.addGestureRecognizer(tapOnAnalyticsView)
        analyticsView.isUserInteractionEnabled = true
        
        let tapOnSettingsView = UITapGestureRecognizer(target: self, action: #selector(openSettings))
        settingsView.addGestureRecognizer(tapOnSettingsView)
        settingsView.isUserInteractionEnabled = true

    }

    @IBAction func addWasteButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addVC = storyboard.instantiateViewController(withIdentifier: "CreateWasteViewController") as! CreateWasteViewController
        self.present(addVC, animated: true, completion: nil)
    }
    
    @objc private func openPersonalPage(_sender : UITapGestureRecognizer) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "PersonalPageViewController") as! PersonalPageViewController
        present(vc, animated: true)
        print("success personal")
    }
    @objc private func openStatsPage(_sender : UITapGestureRecognizer) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "StatsViewController") as! StatsViewController
        present(vc, animated: true)
        print("success stats")
    }
    @objc private func openAnalytics(_sender : UITapGestureRecognizer) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "AnalyticsViewController") as! AnalyticsViewController
        //vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        print("TypesViewController opened")
        print("success analytics")
    }
    @objc private func openSettings(_sender : UITapGestureRecognizer) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "SettingsViewController") as! SettingsViewController
        present(vc, animated: true)
        print("success settings")
    }
}

