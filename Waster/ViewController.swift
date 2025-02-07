//
//  ViewController.swift
//  Waster
//
//  Created by Don Wolfton on 3.01.24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var personalPageView: UIView!
    
    @IBOutlet weak var persPageIcon: UIImageView!
    
    @IBOutlet weak var personalStatsView: UIView!
    
    @IBOutlet weak var statsIcon: UIImageView!
    
    @IBOutlet weak var analyticsView: UIView!
    
    @IBOutlet weak var analyticsIcon: UIImageView!
    
    @IBOutlet weak var settingsView: UIView!
    
    @IBOutlet weak var settingsIcon: UIImageView!
    
    @IBOutlet weak var yourPageLabel: UILabel!
    
    @IBOutlet weak var allWastesLabel: UILabel!
    
    @IBOutlet weak var analyticsLabel: UILabel!
    
    @IBOutlet weak var settingsLabel: UILabel!
    
    @IBOutlet weak var plusButtonView: UIView!
    
    
    @IBOutlet weak var proButton: UIButton!
    
    let plusIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "plus")
        image.tintColor = .systemYellow
        return image
    }()
    
    //var isFirstLaunch = UserDefaults.standard.bool(forKey: "isFirstLaunch")
    
    override func viewDidAppear(_ animated: Bool) {
        if isFirstLaunchApplication {
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let splash = sb.instantiateViewController(identifier: "SplashViewController") as! SplashViewController
            splash.modalPresentationStyle = .overFullScreen
            self.present(splash, animated: false)
            UserDefaults.standard.set(false, forKey: "isFirstLaunch")
        } else {
            return
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .themeBG
        view.addSubview(plusButtonView)
        view.addSubview(personalPageView)
        view.addSubview(personalStatsView)
        view.addSubview(analyticsView)
        view.addSubview(settingsView)
        
        personalPageView.layer.cornerRadius = 30
        personalPageView.addSubview(persPageIcon)
        
        personalStatsView.layer.cornerRadius = 30
        personalStatsView.addSubview(statsIcon)
        
        analyticsView.layer.cornerRadius = 30
        analyticsView.addSubview(analyticsIcon)
        
        settingsView.layer.cornerRadius = 30
        settingsView.addSubview(settingsIcon)
        
        plusButtonView.layer.cornerRadius = 45
        plusButtonView.addSubview(plusIcon)
        plusIcon.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalTo(70)
        }
            
        let tapOnPersPage = UILongPressGestureRecognizer(target: self, action: #selector(openPersonalPage))
        tapOnPersPage.minimumPressDuration = 0
        personalPageView.addGestureRecognizer(tapOnPersPage)
        personalPageView.isUserInteractionEnabled = true
        
        let tapOnStatsPage = UILongPressGestureRecognizer(target: self, action: #selector(openStatsPage))
        tapOnStatsPage.minimumPressDuration = 0
        personalStatsView.addGestureRecognizer(tapOnStatsPage)
        personalStatsView.isUserInteractionEnabled = true
        
        let tapOnAnalyticsView = UILongPressGestureRecognizer(target: self, action: #selector(openAnalytics))
        tapOnAnalyticsView.minimumPressDuration = 0
        analyticsView.addGestureRecognizer(tapOnAnalyticsView)
        analyticsView.isUserInteractionEnabled = true
        
        let tapOnSettingsView = UILongPressGestureRecognizer(target: self, action: #selector(openSettings))
        tapOnSettingsView.minimumPressDuration = 0
        settingsView.addGestureRecognizer(tapOnSettingsView)
        settingsView.isUserInteractionEnabled = true
        
        //setupTap(onView: plusButtonView)
        let tapOnPlus = UILongPressGestureRecognizer(target: self, action: #selector(openAddWasteScreen))
        tapOnPlus.minimumPressDuration = 0
        plusButtonView.addGestureRecognizer(tapOnPlus)
        plusButtonView.isUserInteractionEnabled = true
        
        //test
        dataForMonthStatsArray.append(MonthStats(month: "December"))
        dataForMonthStatsArray.append(MonthStats(month: "November"))
        dataForMonthStatsArray.append(MonthStats(month: "July"))

    }
    
    @objc private func openAddWasteScreen(gesture: UILongPressGestureRecognizer) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addVC = storyboard.instantiateViewController(withIdentifier: "CreateWasteViewController") as! CreateWasteViewController
        self.present(addVC, animated: true, completion: nil)
        if gesture.state == .began {
            plusButtonView.backgroundColor = .ifTapped
        } else if gesture.state == .ended || gesture.state == .cancelled {
            plusButtonView.backgroundColor = .systemGreen
        }
    }
    @objc private func openPersonalPage(_sender : UILongPressGestureRecognizer) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "PersonalPageViewController") as! PersonalPageViewController
        present(vc, animated: true)
        print("success personal")
        if _sender.state == .began {
            personalPageView.backgroundColor = .ifTapped
        } else if _sender.state == .ended || _sender.state == .cancelled {
            personalPageView.backgroundColor = .systemGreen
        }
    }
    @objc private func openStatsPage(_sender : UILongPressGestureRecognizer) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
//        let vc = sb.instantiateViewController(identifier: "StatsViewController") as! StatsViewController
        let vc = WastesViewController()
        vc.modalPresentationStyle = .pageSheet
            present(vc, animated: true)
        print("WastesViewController opened")
        if _sender.state == .began {
            personalStatsView.backgroundColor = .ifTapped
        } else if _sender.state == .ended || _sender.state == .cancelled {
            personalStatsView.backgroundColor = .systemGreen
        }
    }
    @objc private func openAnalytics(_sender : UILongPressGestureRecognizer) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "AnalyticsViewController") as! AnalyticsViewController
        //vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        print("TypesViewController opened")
        print("success analytics")
        if _sender.state == .began {
            analyticsView.backgroundColor = .ifTapped
        } else if _sender.state == .ended || _sender.state == .cancelled {
            analyticsView.backgroundColor = .systemGreen
        }
    }
    @objc private func openSettings(_sender : UILongPressGestureRecognizer) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "SettingsViewController") as! SettingsViewController
        present(vc, animated: true)
        print("success settings")
        if _sender.state == .began || _sender.state == .changed {
            settingsView.backgroundColor = .ifTapped
        } else if _sender.state == .ended || _sender.state == .cancelled {
            settingsView.backgroundColor = .systemGreen
        }
    }
    private func setupTap(onView: UIView) {
        let touchDown = UILongPressGestureRecognizer(target:self, action: #selector(didTouchDown))
        touchDown.minimumPressDuration = 0
        onView.addGestureRecognizer(touchDown)
    }
    @objc func didTouchDown(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            plusButtonView.backgroundColor = .systemMint
        }
    }
    
    @IBAction func openBanner(_ sender: Any) {
        let vc = ShowBannerViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
    }
    
}

