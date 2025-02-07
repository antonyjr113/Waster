//
//  WastesTableViewController.swift
//  Waster
//
//  Created by Don Wolfton on 18.01.25.
//

import UIKit
import SnapKit

class WastesTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let wastesTable: UITableView =  {
        let table = UITableView()
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        view.addSubview(wastesTable)
        wastesTable.delegate = self
        wastesTable.dataSource = self
        let nib = UINib(nibName: "WastesTableTableViewCell", bundle: nil)
        wastesTable.register(nib, forCellReuseIdentifier: "WastesTableTableViewCell")
        wastesTable.snp.makeConstraints { make in
            make.width.height.equalToSuperview()
            make.centerX.centerY.equalToSuperview()
        }
        wastesTable.rowHeight = 150
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wastesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WastesTableTableViewCell", for: indexPath) as! WastesTableTableViewCell
        for _ in wastesArray {
            var iconName = ""
            
            switch iconName {
            case "car":
                iconName = "car"
            case "health":
                iconName = "heart.circle"
            case "joy":
                iconName = "gamecontroller"
            case "home":
                iconName = "house"
            case "child":
                iconName = "figure.arms.open"
            case "subs":
                iconName = "play.tv.fill"
            default :
                break
            }
            cell.nameLabel.text = wastesArray[indexPath.row].name
            cell.amountLabel.text = wastesArray[indexPath.row].wasteAmount
            cell.dateLabel.text = wastesArray[indexPath.row].date
            //cell.iconImage.image = UIImage(systemName: wastesArray[indexPath.row].type)
            switch wastesArray[indexPath.row].type {
            case "car":
                cell.iconImage.image = UIImage(systemName: "car")
            case "health":
                cell.iconImage.image = UIImage(systemName: "heart.circle")
            case "joy":
                cell.iconImage.image = UIImage(systemName: "gamecontroller")
            case "home":
                cell.iconImage.image = UIImage(systemName: "house")
            case "child":
                cell.iconImage.image = UIImage(systemName: "figure.arms.open")
            case "subs":
                cell.iconImage.image = UIImage(systemName: "play.tv.fill") //bug
            default :
                break
            }
            cell.backgroundColor = ColorRandomizer.shared.randomizeColors()
        }
        return cell
    }
    
}
