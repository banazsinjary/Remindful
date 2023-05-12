//
//  HabitCell.swift
//  Remindful
//
//  Created by Banaz Sinjary on 5/11/23.
//

import UIKit

class HabitCell: UITableViewCell {

    @IBOutlet weak var habitLabel: UILabel!
    
    @IBOutlet var dayButtons: [UIButton]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func dayButtonTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
            
            if sender.isSelected {
                sender.backgroundColor = UIColor.black
                sender.setTitleColor(.white, for: .normal)
            } else {
                sender.backgroundColor = UIColor.clear
                sender.setTitleColor(.black, for: .normal)
            }
    }
    
}
