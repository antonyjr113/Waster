//
//  PersonalPageTableViewCell.swift
//  Waster
//
//  Created by Don Wolfton on 3.09.24.
//

import UIKit

class PersonalPageTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var textInCell: UILabel!

    @IBOutlet weak var iconInCell: UIImageView!
    
    @IBOutlet weak var cellSelector: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        cellSelector.image = UIImage(systemName: "circle")
        textInCell.textColor = .texts
    }
    
}
