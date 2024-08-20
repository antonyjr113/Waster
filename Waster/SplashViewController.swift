//
//  SplashViewController.swift
//  Waster
//
//  Created by Don Wolfton on 2.08.24.
//

import UIKit
import Lottie

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let animationView = LottieAnimationView(name: "animationSplash")
        self.view.addSubview(animationView)
        animationView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(160)
            $0.width.equalTo(100)
            $0.height.equalTo(100)
        }
        animationView.loopMode = .repeat(2.0)
        animationView.play { finished in
            animationView.stop()
            DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
                self.dismiss(animated: false)
            })
        }
    }
}
