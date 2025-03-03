//
//  StatsViewController.swift
//  Waster
//
//  Created by Don Wolfton on 17.01.24.
//

import UIKit
import SnapKit


class StatsViewController: UIViewController {
    
    
    @IBOutlet weak var sortButton: UIButton!
    
    @IBOutlet weak var shareButtonView: UIImageView!
    
    //var arrayForStats: [Waste] = UserDefaults.standard.object(forKey: "wastesArray")
    
    var i = 0
    
    var baseX = 15
    
    var baseY = 0
    
    var sortedBaseX = 15
    
    var sortedBaseY = 50
    
    let delta = 20
    
    var iconForLastWaste: Icon?
    
    var delegate: TransferData?
    
    var wasteNumber = wastesArray.count
    
    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .themeBg
        return scroll
    }()
    
    let contentView: UIView = {
        let addView = UIView()
        addView.backgroundColor = .themeBg
        return addView
    }()
    
    let picker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    var selectedDate = Date()
    var isTapped = false
    var tapCounter = 0
    
    let edit = EditAlert(firstField: "Edit Note", secondField: "Edit Amount", thirdField: "Edit Type")
    
    let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
    var blurEffectView = UIVisualEffectView()
    
    let placeholder = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("StatsViewController opened")
        
        view.backgroundColor = .themeBg
        sortButton.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(90)
            $0.bottom.equalToSuperview().offset(-50)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
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
        baseY = Int(contentView.frame.minY)
        if isTapped {
            sortButton.setTitle("Sort", for: .normal)
            UIView.animate(withDuration: 1, delay: 0.33) {
                self.picker.removeFromSuperview()
            }
            isTapped = false
        }
        
        if wastesArray.isEmpty {
            view.addSubview(placeholder)
            placeholder.snp.makeConstraints { make in
                make.centerX.centerY.equalToSuperview()
            }
            placeholder.text = "No wastes"
            placeholder.textAlignment = .center
            placeholder.font = placeholder.font.withSize(25)
            placeholder.textColor = UIColor(named: "systemWhite")
        }
        else {
            placeholder.removeFromSuperview()
            for element in wastesArray {
                addNewWaste(onView: contentView, element: element, iconType: element.type )
                let forReport = Reports(reportDate: element.date, icon:  element.type , note: element.name)
                dataForReportsArray.append(forReport)
            }
        }
        reportsArray.append(dataForReportsArray)
        let tap = UITapGestureRecognizer(target: self, action: #selector(showSavedDataAlert))
        shareButtonView.addGestureRecognizer(tap)
        shareButtonView.isUserInteractionEnabled = true
        print("N reports = ", dataForReportsArray.count)
    }
    private func addNewWaste(onView: UIView, element: Waste, iconType: String) {
        let new = UIView(frame: CGRect(x: baseX, y: baseY, width: 365, height: 150))
        onView.addSubview(new)
        let backForView = ColorRandomizer.shared.randomizeColors()
        new.backgroundColor = backForView
        new.layer.cornerRadius = 10
        let name = UILabel()
        new.addSubview(name)
        name.text = element.name
        name.textColor = UIColor(named: "systemBackground")
        print(name)
        name.font = UIFont(name: "system", size: 15)
        name.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.leading.equalToSuperview().offset(15)
            make.width.equalTo(100)
            make.height.equalTo(20)
        }
        // long tap - open edit alert
        let longTap = UILongPressGestureRecognizer(target: self, action: #selector(openEditWindow))
        new.addGestureRecognizer(longTap)
        new.isUserInteractionEnabled = true
        let summ = UILabel()
        new.addSubview(summ)
        summ.text = element.wasteAmount
        summ.textColor = UIColor(named: "systemBackground")
        summ.font = UIFont(name: "system", size: 15)
        summ.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.leading.equalToSuperview().offset(15)
            make.width.equalTo(100)
        }
        let icon = UILabel()
        new.addSubview(icon)
        //icon.text = delegate?.transferIcon()
        //print("DELEGATE ICON TEXT = ", icon.text)
        let whatChosen = Icons.RawValue.self
        print("!!!!!! what chosen - ", whatChosen)
        icon.font = UIFont(name: "system", size: 15)
        icon.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(90)
            make.leading.equalToSuperview().offset(15)
            make.width.equalTo(100)
        }
        let iconView = UIImageView()
        new.addSubview(iconView)
        var iconToApply = ""
        switch iconType {
        case "car":
            iconToApply = "car"
        case "health":
            iconToApply = "heart.circle"
        case "joy":
            iconToApply = "gamecontroller"
        case "home":
            iconToApply = "house"
        case "child":
            iconToApply = "figure.arms.open"
        case "subs":
            iconToApply = "play.tv.fill"
        default :
            break
        }
        print("isSetForIconForLastWaste = ", iconToApply)
        iconView.image = UIImage(systemName: iconToApply)
        iconView.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.width.equalTo(90)
            make.height.equalTo(90)
        }
        let dateLabel = UILabel()
        new.addSubview(dateLabel)
        dateLabel.textColor = UIColor(named: "systemBackground")
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "dd-MM-yyyy"
        dateLabel.text = format.string(from: date)
        dateLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.width.equalTo(100)
        }
        baseY+=180
        // append report
//        let forReport = Reports(reportDate: dateLabel.text, icon: iconToApply, note: summ.text)
//        dataForReportsArray.append(forReport)
    }
    private func randomizeColors() -> UIColor {
        let numberOfColors = (colorsForWastes.count - 1)
        let index = Int.random(in: 0...numberOfColors)
        return colorsForWastes[index]
    }
    @IBAction func sortButtonTap(_ sender: Any) { //пофиксить проблему без выбора даты не закрывается
        print("sortButtonTap success")
        print(isTapped)
        sortButton.setTitle("Close", for: .normal)
        picker.frame.origin.x = view.frame.midX - 150
        picker.frame.origin.y = view.frame.midY - 150
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .inline
        picker.backgroundColor = .systemBackground
        picker.alpha = 0
        picker.addTarget(self, action: #selector(setChosenData), for: UIControl.Event.valueChanged)
        view.addSubview(picker)
        UIView.animate(withDuration: 0.5, delay: 0) {
            self.picker.alpha = 1
            self.picker.frame.size.width = 300
            self.picker.frame.size.height = 300
        }
        isTapped = true
        print("isTapped = ", isTapped)
        tapCounter += 1
        checkTapCounter()
        checkForSort()
    }
    @objc func showSavedDataAlert() {
        if wastesArray.isEmpty {
            let alert = UIAlertController(title: "Nothing to save", message: "Add wastes to save them into Report :)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
        print("Save Report tapped")
        //save the report with current data in screen
        let allWastesData = JSONManager()
        allWastesData.saveData()
        let alert = UIAlertController(title: "Done", message: "Report is saved to Your Page :)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
        self.present(alert, animated: true)
        print("saved wastes = ", dataForReportsArray.count)
    }
    @objc func setChosenData() {
        selectedDate = self.picker.date
        print("SELECTED DATE = ", selectedDate)
        //sortWastesDueToDate()
    }
    private func checkTapCounter() {
        if tapCounter > 1 {
            sortButton.setTitle("Sort", for: .normal)
            tapCounter = 0
            UIView.animate(withDuration: 1, delay: 0.33) {
                self.picker.removeFromSuperview()
            }
        }
    }
    @objc private func openEditWindow() {
//        UIView.animate(withDuration: 0.5, delay: 0.5) {
//            self.blurEffectView = UIVisualEffectView(effect: self.blurEffect)
//            self.blurEffectView.frame = self.view.bounds
//            self.blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//            self.view.addSubview(self.blurEffectView)
//        }
        edit.editAlertView.alpha = 0
        UIView.animate(withDuration: 0.5, delay: 0.5) {
            self.edit.openEditAlert(onView: self.view)
            self.edit.editAlertView.alpha = 1
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
        }
        edit.closeButton.addTarget(self, action: #selector(closeEditAlert), for: .touchUpInside)
        edit.firstOption.addTarget(self, action: #selector(openAlertToTypeValue), for: .touchUpInside)
        edit.secondOption.addTarget(self, action: #selector(openAlertToTypeValue), for: .touchUpInside)
        edit.thirdOption.addTarget(self, action: #selector(openAlertToTypeValue), for: .touchUpInside)
    }
    @objc private func openAlertToTypeValue() {
        let alert = UIAlertController(title: "Change data", message: "Please, enter new value: ", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = ""
        }
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { [weak alert] (_) in
            let tf = alert?.textFields![0]
        }))
        alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: { [weak alert] (_) in
            alert?.dismiss(animated: true)
        }))
        self.present(alert, animated: true)
    }
    @objc private func closeEditAlert() {
        UIView.animate(withDuration: 0.5, delay: 0.5) {
            self.edit.editAlertView.removeFromSuperview()
            self.edit.editAlertView.alpha = 0
            //self.blurEffectView.removeFromSuperview()
        }
    }
    private func sortWastes(){
        let formater = DateFormatter()
        formater.dateFormat = "dd-MM-yyyy"
        let chosen = formater.string(from: selectedDate)
        print(chosen)
        var newArray = [Waste]()
        for element in wastesArray {
            if element.date == chosen {
                newArray.append(element)
            }
        }
        if DateManager.shared.returnCurrentDate() != chosen {
            print("SORT")
            for element in newArray {
                addNewWaste(onView: view, element: element, iconType: element.type ?? "car")
            }
            print("USED BASE ARRAY")
        }
        else {
            for element in wastesArray {
                addNewWaste(onView: view, element: element, iconType: element.type ?? "car")
            }
            print("USED SORTED ARRAY")
        }
    }
    private func checkForSort(){
        let formater = DateFormatter()
        formater.dateFormat = "dd-MM-yyyy"
        let chosen = formater.string(from: selectedDate)
        print(chosen)
        var newArray = [Waste]()
        for element in wastesArray {
            if element.date == chosen {
                newArray.append(element)
            }
        }
        if DateManager.shared.returnCurrentDate() != chosen {
            for element in newArray {
                addNewWaste(onView: view, element: element, iconType: element.type ?? "car")
            }
            print("USED BASE ARRAY")
        }
    }
}



