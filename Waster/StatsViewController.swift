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
    
    var i = 0
    
    var baseX = 15
    
    var baseY = 0
    
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
    let edit = EditAlert()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("StatsViewController opened")
        
        view.backgroundColor = .themeBg
        
        // добавить сюда text view для отображения даты текущей и добавления date picker
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
        
        for element in wastesArray {
            addNewWaste(onView: contentView, element: element)
        }
        
        //        let allWastesData = JSONManager()
        //        allWastesData.saveData()
        
        //        guard let lastAddedElement = wastesArray.last else {
        //            return
        //            print("no element in wastes array")
        //        }
        //        addNewWaste(onView: view, element: lastAddedElement)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(openShareView))
        shareButtonView.addGestureRecognizer(tap)
        shareButtonView.isUserInteractionEnabled = true
        
        if isTapped {
            sortButton.setTitle("Sort", for: .normal)
            UIView.animate(withDuration: 1, delay: 0.33) {
                self.picker.removeFromSuperview()
            }
            isTapped = false
        }
    }
    
    private func addNewWaste(onView: UIView, element: Waste) {
        
        let new = UIView(frame: CGRect(x: baseX, y: baseY, width: 365, height: 150))
        onView.addSubview(new)
        let backForView = ColorRandomizer.shared.randomizeColors()
        new.backgroundColor = backForView
        
        let name = UILabel()
        new.addSubview(name)
        name.text = element.name
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
        summ.font = UIFont(name: "system", size: 15)
        summ.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.leading.equalToSuperview().offset(15)
            make.width.equalTo(100)
        }
        
        let icon = UILabel()
        new.addSubview(icon)
        icon.text = delegate?.transferIcon()
        print("DELEGATE ICON TEXT = ", icon.text)
        let whatChosen = Icons.RawValue.self
        print("!!!!!! what chosen - ", whatChosen)
        
        
        icon.font = UIFont(name: "system", size: 15)
        icon.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(90)
            make.leading.equalToSuperview().offset(15)
            make.width.equalTo(100)
        }
        
        var iconView = UIImageView()
        
        new.addSubview(iconView)
        var iconToApply = ""
        
        switch wastesArray.last?.type ?? "car" {
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
        print("isSetForIConForLastWaste = ", iconToApply)
        
        
        iconView.image = UIImage(systemName: iconToApply)
        iconView.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.width.equalTo(90)
            make.height.equalTo(90)
        }
        
        let dateLabel = UILabel()
        new.addSubview(dateLabel)
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
        picker.backgroundColor = .white
        picker.alpha = 0
        picker.addTarget(self, action: #selector(setChosenData), for: UIControl.Event.valueChanged)
        view.addSubview(picker)
        
        UIView.animate(withDuration: 0.5, delay: 0.33) {
            self.picker.alpha = 1
            self.picker.frame.size.width = 300
            self.picker.frame.size.height = 300
        }
        isTapped = true
        print("isTapped = ", isTapped)
        tapCounter += 1
        checkTapCounter()
    }

    @objc func openShareView() {
        print("openShareButton tap success")
        
        let allWastesData = JSONManager()
        allWastesData.saveData()
        
        let items = ["Save or share your wastes", ]
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(ac, animated: true)
        
    }
    
    @objc func setChosenData() {
        selectedDate = self.picker.date
        print(selectedDate)
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
        edit.editAlertView.alpha = 0
        UIView.animate(withDuration: 0.5, delay: 0.5) {
            self.edit.openEditAlert(onView: self.view)
            self.edit.editAlertView.alpha = 1
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
        }
        edit.closeButton.addTarget(self, action: #selector(closeEditAlert), for: .touchUpInside)
        edit.name.addTarget(self, action: #selector(openAlertToTypeValue), for: .touchUpInside)
        edit.desc.addTarget(self, action: #selector(openAlertToTypeValue), for: .touchUpInside)
        edit.icon.addTarget(self, action: #selector(openAlertToTypeValue), for: .touchUpInside)
        
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
        }
    }
}



