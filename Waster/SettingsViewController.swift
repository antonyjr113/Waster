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
        
        let tap = UILongPressGestureRecognizer(target: self, action: #selector(makeRequest))
        tap.minimumPressDuration = 0
        touView.addGestureRecognizer(tap)
        touView.isUserInteractionEnabled = true
        
        if tap.state == .began {
            touView.backgroundColor = .systemMint
        }
    }
    
    private func simpleGetUrlRequestWithErrorHandling() -> String {
        let session = URLSession.shared
        let url = URL(string: "https://sgonay.com.pl/rules")!
        var result = ""
        
        let task = session.dataTask(with: url) { data, response, error in
            
            result = "Success"
            
            if error != nil || data == nil {
                print("Client error!")
                return
            }
            
            guard let response = response as? HTTPURLResponse, (500...599).contains(response.statusCode) else {
                result = "Server error!"
                return
            }
            
            if response == response as? HTTPURLResponse, (400...499).contains(response.statusCode) {
                result = "Client error!"
            } else {
                return
            }
            //
            //                guard let mime = response.mimeType, mime == "application/json" else {
            //                    print("Wrong MIME type!")
            //                    return
            //                }
            //
            //                do {
            //                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
            //                    print("The Response is : ",json)
            //                } catch {
            //                    print("JSON error: \(error.localizedDescription)")
            //                }
            
        }
        task.resume()
        print(result)
        return result
    }
    
    @objc private func makeRequest(_sender: UILongPressGestureRecognizer) {
        simpleGetUrlRequestWithErrorHandling()
        if _sender.state == .began {
            touView.backgroundColor = .ifTapped
        } else if _sender.state == .ended || _sender.state == .cancelled {
            touView.backgroundColor = .systemGreen
        }
        let webVC = WebShowViewController(linkToShow: "https://sgonay.com.pl/rules")
        webVC.view.backgroundColor = .themeBg
        webVC.modalPresentationStyle = .pageSheet
        present(webVC, animated: true)
//        var res = simpleGetUrlRequestWithErrorHandling()
//        if res == "Success" {
//            
//            let webVC = WebShowViewController(linkToShow: "https://sgonay.com.pl/rules")
//            let romashka = UIActivityIndicatorView(frame: CGRect(x: view.frame.midX, y: view.frame.midY, width: 50, height: 50))
//            romashka.color = .green
//            webVC.view.addSubview(romashka)
//            UIView.animate(withDuration: 3) {
//                romashka.startAnimating()
//            }
//            webVC.view.backgroundColor = .themeBg
//            webVC.modalPresentationStyle = .pageSheet
//            present(webVC, animated: true)
//        } else if res == "Client error!" {
//            let alert = UIAlertController(title: "Ooops :(", message: "Something went wrong", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "Try later", style: .default))
//            self.present(alert, animated: true)
//            print("Client error!")
//        } else if res == "Server error!" {
//            let alert = UIAlertController(title: "Ooops :(", message: "Couldn't connect to server", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "Try later", style: .default))
//            self.present(alert, animated: true)
//            print("Server error!")
//        }
    }
}
