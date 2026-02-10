//
//  WastesTableTableViewCell.swift
//  Waster
//
//  Created by Don Wolfton on 19.01.25.
//

import UIKit

class WastesTableTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var amountLabel: UILabel!
    
    @IBOutlet weak var checkboxView: UIView!
    
    @IBOutlet weak var iconImage: UIImageView!
    
    let checkBoxImage: UIImageView = {
        let image = UIImageView()
        var index = 0
        image.layer.cornerRadius = 12.5
        image.image = UIImage(systemName: "checkmark.circle")
        image.tintColor = .clear
        image.backgroundColor = .clear
        return image
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        checkboxView.addSubview(checkBoxImage)
        checkBoxImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            checkBoxImage.centerYAnchor.constraint(equalTo: checkboxView.centerYAnchor),
            checkBoxImage.centerXAnchor.constraint(equalTo: checkboxView.centerXAnchor),
            checkBoxImage.widthAnchor.constraint(equalToConstant: 25),
            checkBoxImage.heightAnchor.constraint(equalToConstant: 25)
        ])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func activateCheckboxOnCell() {
        checkBoxImage.tintColor = .systemBlue
    }
    func deactivateCheckboxOnCell() {
        checkBoxImage.tintColor = .clear
    }
}
