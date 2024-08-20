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
        tableTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(20)
        }
        tableTitle.text = titleOfTable
        tableTitle.font = UIFont(name: "system", size: 20)
        tableTitle.textAlignment = .center
        tableTitle.textColor = .systemBlue
        makeTitles()
        statsTable.backgroundColor = .themeBG
        statsTable.delegate = self
        statsTable.dataSource = self
        statsTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfCells
        print("!!! number of rows = ", numberOfCells)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if arrayForTypes.count != 0 {
            cell.textLabel?.text = "\(arrayForTypesTitles[indexPath.row])"
        } else if arrayForReports.count != 0 && arrayForReports.count <= arrayForReportsTitles.count {
            cell.textLabel?.text = "Report from \(arrayForReportsTitles[indexPath.row])"
        } else if arrayForMonthStats.count != 0 {
            cell.textLabel?.text = "\(arrayForMonthStatsTitles[indexPath.row])"
        }
        //cell.textLabel?.text = "\(titleForRowArray[indexPath.row])"
        cell.textLabel?.font = .systemFont(ofSize: 28, weight: .semibold)
        cell.textLabel?.textColor = .systemBlue
        cell.backgroundColor = .themeBG
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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

}
