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
    
    @IBOutlet weak var addNewTypeButton: UIButton!
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    let contentView: UIView = {
    let addView = UIView()
        addView.backgroundColor = .systemIndigo
    return addView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("PersonalPageViewController opened")
        
        view.backgroundColor = .themeBG
        scrollView.backgroundColor = .themeBG
        
        addNewTypeButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        addNewTypeButton.layer.cornerRadius = 10
        
        view.addSubview(profileTitleView)
        profileTitleView.backgroundColor = .systemMint
        let tapOnProfile = UITapGestureRecognizer(target: self, action: #selector(openEditWindow))
        profileTitleView.addGestureRecognizer(tapOnProfile)
        profileTitleView.isUserInteractionEnabled = true
        
        
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
        
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.top)
            $0.bottom.equalTo(scrollView.snp.bottom)
            $0.leading.equalTo(scrollView.snp.leading)
            $0.trailing.equalTo(scrollView.snp.trailing)
            
            $0.width.equalTo(scrollView)
            $0.height.equalTo(scrollView).multipliedBy(2)
        }

    }
    
    @objc private func openPicker() {
        let openPicker = self.imagePicker(sourceType: .camera)
        self.present(openPicker, animated: true)
    }
    
    @objc private func openEditWindow() {
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        let vcEditWindow = sb.instantiateViewController(withIdentifier: "EditWindow") as! EditWindow
//        present(vcEditWindow, animated: true)
        let editWindow = EditWindow()
        editWindow.setConstraints(onView: view)
        editWindow.modalPresentationStyle = .overFullScreen
        present(editWindow, animated: true)
    }
    
    private func fillDate(label: UILabel) {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "dd-MM"
        label.text = format.string(from: date)
    }
    
    private func imagePicker(sourceType: UIImagePickerController.SourceType) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        return imagePicker
    }
    
    @IBAction func addNewTypeTap(_ sender: Any) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let wastePageVC = sb.instantiateViewController(withIdentifier: "WastePageViewController") as! WastePageViewController
        
        present(wastePageVC, animated: true)
    }
    
 
}
