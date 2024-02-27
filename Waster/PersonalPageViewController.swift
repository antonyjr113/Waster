//
//  PersonalPageViewController.swift
//  Waster
//
//  Created by Don Wolfton on 17.01.24.
//

import UIKit

class PersonalPageViewController: UIViewController {
    
    @IBOutlet weak var photoView: UIImageView!
    
    @IBOutlet weak var editButtonView: UIView!
    
    @IBOutlet weak var editIcon: UIImageView!
    
    @IBOutlet weak var profileTitleView: UIView!
    
    @IBOutlet weak var currentDateLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .themeBG
        
        view.addSubview(titleLabel)
        titleLabel.font = UIFont.systemFont(ofSize: 28)
        titleLabel.textColor = .texts
        titleLabel.text = "Your Page"
        
        view.addSubview(photoView)
        photoView.layer.cornerRadius = 20
        let tapOnPhoto = UITapGestureRecognizer(target: self, action: #selector(openPicker))
        photoView.addGestureRecognizer(tapOnPhoto)
        photoView.isUserInteractionEnabled = true
        
        
        view.addSubview(editButtonView)
        editButtonView.layer.cornerRadius = 30
        
        view.addSubview(profileTitleView)
        profileTitleView.layer.cornerRadius = 20
    
        
        view.addSubview(currentDateLabel)
        currentDateLabel.font = UIFont.systemFont(ofSize: 21)
        fillDate(label: currentDateLabel)
        currentDateLabel.textColor = .texts

    }
    
    @objc private func openPicker() {
        let openPicker = self.imagePicker(sourceType: .camera)
        self.present(openPicker, animated: true)
    }
    
    private func fillDate(label: UILabel) {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "dd-MM"
        label.text = format.string(from: date)
    }
    
    func imagePicker(sourceType: UIImagePickerController.SourceType) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        return imagePicker
    }
 
}
