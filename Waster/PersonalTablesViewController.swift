//
//  PersonalTablesViewController.swift
//  Waster
//
//  Created by Don Wolfton on 23.07.24.
//

import UIKit
import SnapKit

class PersonalTablesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var arrayWithData: [Any] = []
    
    var arrayForReports: [Reports] = []
    var arrayForMonthStats: [MonthStats] = []
    var arrayForTypes: [String] = []
    
    var titleForRow: String?
    var titleForRowArray: [String] = []
    
    var arrayForTypesTitles: [String] = []
    var arrayForMonthStatsTitles: [String] = []
    var arrayForReportsTitles: [String] = []
    
    var numberOfCells: Int = 0
    
    var titleOfTable: String = ""
    
    var isSelectTapped = false
    
    var selectedRows: [IndexPath] = []
    var selectedRowsString: [String] = []
    
    let statsTable: UITableView = {
        let table = UITableView()
        table.backgroundColor = .themeBg
        table.allowsSelection = true
        table.register(PersonalTablesCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    let placeholder: UILabel = {
        let label = UILabel()
        label.text = "No relevant data :("
        label.font = UIFont(name: "system", size: 42)
        label.textAlignment = .center
        return label
    }()
    let tableTitle: UILabel = {
        let title = UILabel()
//        title.font = UIFont(name: "system", size: 42)
//        title.textAlignment = .center
//        title.textColor = .systemBlue
        return title
    }()
    let clearButton: UIView = {
        let view = UIView()
        return view
    }()
    let clearButtonTitle: UILabel = {
        let text = UILabel()
        text.text = "Sort"
        text.textColor = .white
        text.textAlignment = .center
        return text
    }()
    let selectButton: UIView = {
        let view = UIView()
        return view
    }()
    let selectButtonTitle: UILabel = {
        let text = UILabel()
        text.text = "Select"
        text.textColor = .white
        text.textAlignment = .center
        return text
    }()
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.backgroundColor = .themeBG
        view.addSubview(statsTable)
        statsTable.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalToSuperview().offset(40)
            make.bottom.equalToSuperview()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableTitle)
        view.addSubview(clearButton)
        view.addSubview(selectButton)
        clearButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(70)
            make.height.equalTo(25)
        }
        clearButton.layer.cornerRadius = 5
        clearButton.backgroundColor = .systemBlue
        clearButton.addSubview(clearButtonTitle)
        clearButtonTitle.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview()
        }
        let tapOnClear = UITapGestureRecognizer(target: self, action: (#selector(showSuccessSavedAlert)))
        clearButton.addGestureRecognizer(tapOnClear)
        clearButton.isUserInteractionEnabled = true
        selectButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-20)
            make.width.equalTo(70)
            make.height.equalTo(25)
        }
        selectButton.layer.cornerRadius = 5
        selectButton.backgroundColor = .systemBlue
        selectButton.addSubview(selectButtonTitle)
        selectButtonTitle.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview()
        }
        let tapOnSelect = UITapGestureRecognizer(target: self, action: (#selector(selectRows)))
        selectButton.addGestureRecognizer(tapOnSelect)
        selectButton.isUserInteractionEnabled = true
        tableTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(25)
        }
        tableTitle.text = titleOfTable
        tableTitle.font = tableTitle.font.withSize(25)
        tableTitle.textAlignment = .center
        tableTitle.textColor = .systemBlue
        makeTitles()
        statsTable.backgroundColor = .themeBG
        statsTable.delegate = self
        statsTable.dataSource = self
        let nib = UINib(nibName: "PersonalPageTableViewCell", bundle: nil)
        statsTable.register(nib, forCellReuseIdentifier: "PersonalPageTableViewCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfCells
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalPageTableViewCell", for: indexPath) as! PersonalPageTableViewCell
        if arrayForTypes.count != 0 {
            cell.textInCell.text = "\(arrayForTypesTitles[indexPath.row])"
        }
        else
        if arrayForReports.count != 0 && arrayForReports.count <= arrayForReportsTitles.count {
            cell.textInCell.text = "\(arrayForReportsTitles[indexPath.row])"
        }
        else
        if arrayForMonthStats.count != 0 {
            cell.textInCell.text = "\(arrayForMonthStatsTitles[indexPath.row])"
        }
        cell.textInCell.font = .systemFont(ofSize: 24, weight: .semibold)
        cell.textInCell.textColor = .white
        cell.backgroundColor = .themeBG
        cell.cellSelector.image = UIImage(systemName: "circle")
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRows.append(indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "ShowReportViewController") as! ShowReportViewController
        present(vc, animated: true)
        print("IN SELECTED ARRAY = ", selectedRows)
    }
    private func makeTitles() {
        if arrayForTypes.count != 0 {
            for element in arrayForTypes {
                arrayForTypesTitles.append(element)
            }
        }
        if arrayForReports.count != 0 {
            for element in arrayForReports {
                arrayForReportsTitles.append(element.reportDate ?? "ERROR")
            }
        }
        if arrayForMonthStats.count != 0 {
            for element in arrayForMonthStats {
                arrayForMonthStatsTitles.append(element.month ?? "ERROR")
            }
        }
    }
    @objc private func showSuccessSavedAlert() {
        if arrayForTypes.count == 0 || arrayForReports.count == 0 || arrayForMonthStats.count == 0 {
            let alert = UIAlertController(title: "No reports", message: "You have no saved reports yet :)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
        else {
            let alert = UIAlertController(title: "Are you sure?", message: "All your waste reports will be deleted.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "Delete reports", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    @objc private func selectRows() {
        isSelectTapped = true
        if arrayForTypes.count == 0 || arrayForReports.count == 0 || arrayForMonthStats.count == 0 {
            let alert = UIAlertController(title: "No reports", message: "You have no saved reports yet :)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
        print("select button tapped")
    }
}
