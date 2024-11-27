//
//  ShowReportViewController.swift
//  Waster
//
//  Created by Don Wolfton on 7.10.24.
//

import UIKit
import SnapKit

class ShowReportViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var reportTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .themeBg
        reportTableView.backgroundColor = .themeBg
        reportTableView.separatorStyle = .singleLine
        reportTableView.delegate = self
        reportTableView.dataSource = self
        let nib = UINib(nibName: "ReportTableViewCell", bundle: nil)
        reportTableView.register(nib, forCellReuseIdentifier: "ReportTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reportsArray.last?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReportTableViewCell", for: indexPath) as! ReportTableViewCell
        cell.dateLabel.font = UIFont(name: "system", size: 24)
        cell.noteLabel.font = UIFont(name: "system", size: 24)
        
        for array in reportsArray {
            for element in array {
                cell.dateLabel.text = element.reportDate ?? "error"
                cell.noteLabel.text = element.note ?? "error"
            }
        }
        cell.icon.image = UIImage(systemName: dataForReportsArray[indexPath.row].icon ?? "error")
        cell.backgroundColor = .themeBg
        cell.snp.makeConstraints { make in
            make.width.equalTo(tableView.frame.width)
            make.height.equalTo(150)
        }
        return cell
    }
}
