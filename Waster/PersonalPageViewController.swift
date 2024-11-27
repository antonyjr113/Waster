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
    
    let tableForOptions: UITableView = {
        let table = UITableView()
        return table
    }()
    
    let viewForGoal: UIView = {
        let view = UIView()
        return view
    }()
    let iconViewForGoal = UIImageView()
    let labelViewForGoal = UILabel()
    
    let viewForMonthStats: UIView = {
        let view = UIView()
        return view
    }()
    let iconViewForMonthStats = UIImageView()
    let labelViewForMonthStats = UILabel()
    
    let viewForCreateType: UIView = {
        let view = UIView()
        return view
    }()
    let iconForCreateType = UIImageView()
    let labelForCreateType = UILabel()
    
    let viewForReports: UIView = {
        let view = UIView()
        return view
    }()
    let iconForReports = UIImageView()
    let labelForReports = UILabel()
    
    let userName: UILabel = {
        let name = UILabel()
        name.text = "Jules"
        name.font = UIFont(name: "system", size: 30)
        name.textAlignment = .left
        return name
    }()
    let overallBudget: UILabel = {
        let budget = UILabel()
        budget.font = UIFont(name: "system", size: 30)
        budget.textAlignment = .left
        return budget
    }()
    let lastWaste: UILabel = {
        let last = UILabel()
        last.font = UIFont(name: "system", size: 30)
        last.textAlignment = .left
        return last
    }()
    let currency: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let edit = EditAlert(firstField: "Change Name", secondField: "Change Goal To Save", thirdField: "Change Budget")
    var currentLeftBudget = ""
    var goalStatus = ""
    var goalStatusMessage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("PersonalPageViewController opened")
        
        view.backgroundColor = .themeBG
        
        if UserDefaults.standard.value(forKey: "overallBudget").debugDescription.isEmpty {
            overallBudget.text = "enter budget :)"
        } else {
            overallBudget.text = "\(UserDefaults.standard.value(forKey: "overallBudget") ?? "error")\(currencyEntered)"
        }
        
        if UserDefaults.standard.value(forKey: "currencyOnScreen") as? String ?? "percent" != "" {
            let image = UserDefaults.standard.value(forKey: "currencyOnScreen") as? String ?? "percent"
            currency.image = UIImage(systemName: image)
        } else {
            currency.image = UIImage(systemName: "number")
        }

        if wastesArray.isEmpty {
            //overallBudget.text = "\(budgetEntered)\(currencyEntered)"
            lastWaste.text = "no wastes :)"
        } else {
            lastWaste.text = "-\(wastesArray.last?.wasteAmount ?? "error")\(currencyEntered)"
        }
       
        
        addNewTypeButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        addNewTypeButton.layer.cornerRadius = 10
        
        view.addSubview(profileTitleView)
        profileTitleView.backgroundColor = .systemMint

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
        let tapOnProfile = UILongPressGestureRecognizer(target: self, action: #selector(openEditWindow))
        tapOnProfile.minimumPressDuration = 0
        editButtonView.addGestureRecognizer(tapOnProfile)
        editButtonView.isUserInteractionEnabled = true
        
        view.addSubview(profileTitleView)
        profileTitleView.layer.cornerRadius = 20
        profileTitleView.addSubview(userName)
        userName.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
            make.width.equalToSuperview()
        }
        userName.textColor = .systemBlue
        profileTitleView.addSubview(overallBudget)
        overallBudget.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview().offset(-10)
        }
        overallBudget.textColor = .systemBlue
        profileTitleView.addSubview(lastWaste)
        lastWaste.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.width.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        lastWaste.textColor = .systemBlue
        profileTitleView.addSubview(currency)
        currency.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.height.equalTo(70)
            make.trailing.equalToSuperview().offset(-10)
        }
        let tapOnCurrency = UITapGestureRecognizer(target: self, action: #selector(chooseCurrnecy))
        currency.addGestureRecognizer(tapOnCurrency)
        currency.isUserInteractionEnabled = true
                
        view.addSubview(currentDateLabel)
        currentDateLabel.font = UIFont.systemFont(ofSize: 21)
        fillDate(label: currentDateLabel)
        currentDateLabel.textColor = .texts
        
        view.addSubview(viewForGoal)
        viewForGoal.layer.cornerRadius = 15
        viewForGoal.snp.makeConstraints { make in
            make.width.equalTo(160)
            make.height.equalTo(180)
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(addNewTypeButton).offset(50)
        }
        viewForGoal.backgroundColor = .systemGreen
        viewForGoal.addSubview(iconViewForGoal)
        iconViewForGoal.image = UIImage(systemName: "arrow.up.arrow.down.square")
        iconViewForGoal.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.centerX.centerY.equalToSuperview()
        }
        viewForGoal.addSubview(labelViewForGoal)
        labelViewForGoal.text = "Goal Dynamic"
        labelViewForGoal.font = UIFont(name: "system", size: 20)
        labelViewForGoal.textColor = .systemBlue
        labelViewForGoal.backgroundColor = .systemGreen
        labelViewForGoal.textAlignment = .center
        labelViewForGoal.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-5)
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
            make.width.equalTo(viewForGoal).offset(-20)
        }
        let tapOnGoal = UITapGestureRecognizer(target: self, action: #selector(tappedOnGoal))
        viewForGoal.addGestureRecognizer(tapOnGoal)
        viewForGoal.isUserInteractionEnabled = true
        
        view.addSubview(viewForMonthStats)
        viewForMonthStats.layer.cornerRadius = 15
        viewForMonthStats.snp.makeConstraints { make in
            make.width.equalTo(160)
            make.height.equalTo(180)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(addNewTypeButton).offset(50)
        }
        viewForMonthStats.backgroundColor = .systemGreen
        viewForMonthStats.addSubview(iconViewForMonthStats)
        iconViewForMonthStats.image = UIImage(systemName: "calendar")
        iconViewForMonthStats.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.centerX.centerY.equalToSuperview()
        }
        viewForMonthStats.addSubview(labelViewForMonthStats)
        labelViewForMonthStats.text = "Period Stats"
        labelViewForMonthStats.font = UIFont(name: "system", size: 20)
        labelViewForMonthStats.textColor = .systemBlue
        labelViewForMonthStats.backgroundColor = .systemGreen
        labelViewForMonthStats.textAlignment = .center
        labelViewForMonthStats.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-5)
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
            make.width.equalTo(viewForMonthStats).offset(-20)
        }
        let tapOnForMonthStats = UITapGestureRecognizer(target: self, action: #selector(tappedOnForMonthStats))
        viewForMonthStats.addGestureRecognizer(tapOnForMonthStats)
        viewForMonthStats.isUserInteractionEnabled = true
        
        view.addSubview(viewForCreateType)
        viewForCreateType.layer.cornerRadius = 15
        viewForCreateType.snp.makeConstraints { make in
            make.width.equalTo(160)
            make.height.equalTo(180)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-60)
        }
        viewForCreateType.backgroundColor = .systemGreen
        viewForCreateType.addSubview(iconForCreateType)
        iconForCreateType.image = UIImage(systemName: "a.square")
        iconForCreateType.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.centerX.centerY.equalToSuperview()
        }
        viewForCreateType.addSubview(labelForCreateType)
        labelForCreateType.text = "Edit Types"
        labelForCreateType.font = UIFont(name: "system", size: 20)
        labelForCreateType.textColor = .systemBlue
        labelForCreateType.backgroundColor = .systemGreen
        labelForCreateType.textAlignment = .center
        labelForCreateType.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-5)
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
            make.width.equalTo(viewForCreateType).offset(-20)
        }
        let tapOnForCreateType = UITapGestureRecognizer(target: self, action: #selector(tappedOnForCreateType))
        viewForCreateType.addGestureRecognizer(tapOnForCreateType)
        viewForCreateType.isUserInteractionEnabled = true
        
        view.addSubview(viewForReports)
        viewForReports.layer.cornerRadius = 15
        viewForReports.snp.makeConstraints { make in
            make.width.equalTo(160)
            make.height.equalTo(180)
            make.leading.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-60)
        }
        viewForReports.backgroundColor = .systemGreen
        viewForReports.backgroundColor = .systemGreen
        viewForReports.addSubview(iconForReports)
        iconForReports.image = UIImage(systemName: "wallet.pass")
        iconForReports.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.centerX.centerY.equalToSuperview()
        }
        viewForReports.addSubview(labelForReports)
        labelForReports.text = "Reports"
        labelForReports.font = UIFont(name: "system", size: 20)
        labelForReports.textColor = .systemBlue
        labelForReports.backgroundColor = .systemGreen
        labelForReports.textAlignment = .center
        labelForReports.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-5)
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
            make.width.equalTo(viewForReports).offset(-20)
        }
        let tapOnViewForReports = UITapGestureRecognizer(target: self, action: #selector(tappedOnViewForReports))
        viewForReports.addGestureRecognizer(tapOnViewForReports)
        viewForReports.isUserInteractionEnabled = true
        
        updateGoalStatus()
    }
    
    @objc private func openPicker() {
        let openPicker = self.imagePicker(sourceType: .photoLibrary)
        self.present(openPicker, animated: true)
    }
    
    @objc private func openEditWindow(_sender : UILongPressGestureRecognizer) {
        
//        UIView.animate(withDuration: 1, delay: 0) {
//            self.edit.editAlertView.alpha = 1
//            self.edit.openEditAlert(onView: self.view)
//            self.edit.editAlertView.frame.size.width += 300
//            self.edit.editAlertView.frame.size.height += 500
//        }
        if _sender.state == .began {
            editButtonView.backgroundColor = .ifTapped
        } else if _sender.state == .ended || _sender.state == .cancelled {
            editButtonView.backgroundColor = .systemYellow
        }
        edit.openEditAlert(onView: view)
        edit.closeButton.addTarget(self, action: #selector(closeEditAlert), for: .touchUpInside)
        edit.firstOption.addTarget(self, action: #selector(openAlertToTypeUserName), for: .touchUpInside)
        edit.secondOption.addTarget(self, action: #selector(openAlertToTypeBudget), for: .touchUpInside)
        edit.thirdOption.addTarget(self, action: #selector(openAlertToTypeBudget), for: .touchUpInside)
    }
    
    private func fillDate(label: UILabel) {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "dd-MM-yyyy"
        label.text = format.string(from: date)
    }
    
    private func imagePicker(sourceType: UIImagePickerController.SourceType) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        return imagePicker
    }
    
    @IBAction func addNewTypeTap(_ sender: Any) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let wastePageVC = sb.instantiateViewController(withIdentifier: "WastePageViewController") as! WastePageViewController
        
        present(wastePageVC, animated: true)
    }
    @objc private func closeEditAlert() {
        edit.editAlertView.removeFromSuperview()
    }
    @objc private func openAlertToTypeUserName() {
        let alert = UIAlertController(title: "Change data", message: "Please, enter new value: ", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = ""
        }
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { [weak alert] (_) in
            let tf = alert?.textFields![0]
            self.userName.text = tf?.text ?? "errorName"
        }))
        alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: { [weak alert] (_) in
            alert?.dismiss(animated: true)
        }))
        self.present(alert, animated: true)
    }
    @objc private func openAlertToTypeBudget() {
        let alert = UIAlertController(title: "Change data", message: "Please, enter new value: ", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = ""
        }
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { [weak alert] (_) in
            let tf = alert?.textFields![0]
            UserDefaults.standard.set(tf?.text, forKey: "overallBudget")
            self.overallBudget.text = tf?.text ?? "errorName"
        }))
        alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: { [weak alert] (_) in
            alert?.dismiss(animated: true)
        }))
        self.present(alert, animated: true)
    }
    @objc private func chooseCurrnecy() {
        
        let currencyChoice = UIAlertController(title: nil, message: "Choose Currency", preferredStyle: .actionSheet)
        
        let saveAction = UIAlertAction(title: "$", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.currency.image = UIImage(systemName: "dollarsign")
            currencyForImage = "dollarsign"
            currencyEntered = "$"
            UserDefaults.standard.set(currencyForImage, forKey: "currencyOnScreen")
        })
        currencyChoice.addAction(saveAction)
        let deleteAction = UIAlertAction(title: "₽", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.currency.image = UIImage(systemName: "rublesign")
            currencyEntered = "₽"
            currencyForImage = "rublesign"
            UserDefaults.standard.set(currencyForImage, forKey: "currencyOnScreen")
        })
        currencyChoice.addAction(deleteAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Cancelled")
        })
        currencyChoice.addAction(cancelAction)
        self.present(currencyChoice, animated: true, completion: nil)
    }
    @objc private func tappedOnForMonthStats() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "PersonalTablesViewController") as! PersonalTablesViewController
        vc.arrayForMonthStats = dataForMonthStatsArray
        vc.numberOfCells = dataForMonthStatsArray.count
        vc.titleOfTable = "Month Stats"
        present(vc, animated: true)
        print("PersonalTablesViewController Period Stats opened")
    }
    @objc private func tappedOnViewForReports() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "PersonalTablesViewController") as! PersonalTablesViewController
        vc.arrayForReports = dataForReportsArray
        vc.numberOfCells = dataForReportsArray.count
        vc.titleOfTable = "Reports"
        print(dataForReportsArray)
        present(vc, animated: true)
        print("PersonalTablesViewController Reports opened")
        print("counted reports = \(dataForReportsArray.count)")

    }
    @objc private func tappedOnForCreateType() {
        var arrayWithTypes: [String] = []
        for element in analyticsData {
            arrayWithTypes.append(element.key)
        }
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "PersonalTablesViewController") as! PersonalTablesViewController
        vc.arrayForTypes = arrayWithTypes
        vc.numberOfCells = arrayWithTypes.count
        vc.titleOfTable = "Types"
        present(vc, animated: true)
        print("PersonalTablesViewController Types opened")
    }
    private func updateGoalStatus() {
        let intBudget = 0
//        if UserDefaults.standard.value(forKey: "overallBudget").debugDescription.isEmpty == false {
//            intBudget = ((UserDefaults.standard.value(forKey: "overallBudget")) as! NSString).integerValue
//        }
        var normalDelta = 0
        var allWastesForCurrentDate = 0
        for element in wastesArray {
            if element.date == currentDateLabel.text {
                allWastesForCurrentDate += Int(element.wasteAmount) ?? 11
            }
        }
        print("day wastes = ", allWastesForCurrentDate)
        normalDelta = intBudget / 30
        if allWastesForCurrentDate > normalDelta {
            iconViewForGoal.image = UIImage(systemName: "exclamationmark.circle")
            iconViewForGoal.tintColor = .orange
            goalStatus = "Too much wastes :("
            goalStatusMessage = "Decrease your wastes to ahcieve Save Goal. Complete this ahcievement!"
            print("more then availble goal - success")
        } else {
            iconViewForGoal.image = UIImage(systemName: "hand.thumbsup")
            iconViewForGoal.tintColor = .cyan
            goalStatus = "Well done!"
            goalStatusMessage = "Right dynamics! Follow it and your Save Goal will be achieved!"
            print("less then availble goal - success")
        }
    }
    @objc private func tappedOnGoal() {
        let alert = UIAlertController(title: goalStatus, message: goalStatusMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
extension PersonalPageViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            photoView.image = pickedImage
            //resizableImage(withCapInsets: UIEdgeInsets(top: photoView.bounds.maxY, left: photoView.bounds.minX, bottom:  photoView.bounds.minY, right:  photoView.bounds.maxX))

        }
        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
