//
//  PrivacyViewController.swift
//  Waster
//
//  Created by Don Wolfton on 15.01.25.
//

import UIKit
import SafariServices

enum URLS {
    case tou
    case pp
    case review
    case contact
}

class PrivacyViewController: UIViewController {
    
    let linkToShow = "https://www.onliner.by/"

    override func viewDidLoad() {
        super.viewDidLoad()
        showSafariController()
    }
    
    func showSafariController() {
        if let url = URL(string: linkToShow) {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            let vc = SFSafariViewController(url: url, configuration: config)
            present(vc, animated: true)
        }
    }

}
