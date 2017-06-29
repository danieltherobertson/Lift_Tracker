//
//  CustomWorkoutCell.swift
//  Lift_Tracker
//
//  Created by Daniel Robertson on 17/06/2017.
//  Copyright © 2017 Daniel Robertson. All rights reserved.
//

import UIKit

class CustomWorkoutCell: UITableViewCell {

    @IBOutlet weak var cellTextField: UITextField!
    @IBOutlet weak var switchCellLabel: UILabel!
    @IBOutlet weak var cellSwitch: UISwitch!
    @IBOutlet weak var cellButton: UIButton!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
