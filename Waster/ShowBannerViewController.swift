//
//  ShowBannerViewController.swift
//  Waster
//
//  Created by Don Wolfton on 1.12.24.
//

import UIKit
import SwiftUI
import SnapKit

final class ShowBannerViewController: UIViewController {
    
    let close: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        return button
    }()
    var isClose: Bool?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let childView = UIHostingController(rootView: Banner())
        
        addChild(childView)
        childView.view.frame = view.bounds
        view.addSubview(childView.view)
        childView.didMove(toParent: self)
        
        view.addSubview(close)
        close.addTarget(self, action: #selector(closeTapped(_:)), for: .touchUpInside)
        close.snp.makeConstraints { make in
            make.width.height.equalTo(30)
            make.trailing.equalTo(-20)
            make.top.equalTo(50)
        }
        close.layer.cornerRadius = 15
    }
    
    @objc private func closeTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
