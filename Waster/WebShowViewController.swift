//
//  WebShowViewController.swift
//  Waster
//
//  Created by Don Wolfton on 17.09.24.
//

import UIKit
import WebKit

class WebShowViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!

    var linkToShow: String?

    init(linkToShow: String) {
        self.linkToShow = linkToShow
        super.init(nibName: "WebShowViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
        webView.frame = view.bounds
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        guard
            let myURL = URL(string: linkToShow ?? "https://www.onliner.by/")
        else {
            return
        }
        let myRequest = URLRequest(url: myURL)
        webView.load(myRequest)
        print(linkToShow)
    }

}
