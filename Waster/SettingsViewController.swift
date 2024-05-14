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
        print("SettingsViewController opened")
        
        view.backgroundColor = .themeBG
        
        view.addSubview(touView)
        touView.addSubview(touLabel)
        
        
        touView.layer.cornerRadius = 10
        touView.backgroundColor = greenProperty
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
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(makeRequest))
        touView.addGestureRecognizer(tap)
        touView.isUserInteractionEnabled = true
        
        if tap.state == .began {
            touView.backgroundColor = .systemMint
        }
    }
    
    private func simpleGetUrlRequestWithErrorHandling(){
            let session = URLSession.shared
            let url = URL(string: "https://drive.google.com/file/d/1TrVSSylDQAA0_GXuOwrSeVZKD0ZjGT2Q/view?usp=drive_link")!
            
            let task = session.dataTask(with: url) { data, response, error in
                
                if error != nil || data == nil {
                    print("Client error!")
                    return
                }
                
                guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    print("Server error!")
                    return
                }
                
                if response == response as? HTTPURLResponse, (400...499).contains(response.statusCode) {
                    print("Client error!")
                } else {
                    return
                }
                
                guard let mime = response.mimeType, mime == "application/json" else {
                    print("Wrong MIME type!")
                    return
                }
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    print("The Response is : ",json)
                } catch {
                    print("JSON error: \(error.localizedDescription)")
                }
                
            }
            task.resume()
        }
    
    @objc private func makeRequest() {
        simpleGetUrlRequestWithErrorHandling()
    }
    

}
