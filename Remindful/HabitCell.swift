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
        
        // Make buttons round
        for button in dayButtons {
                    button.layer.cornerRadius = button.frame.height / 2
                    button.layer.borderWidth = 1.0
                    button.layer.borderColor = UIColor.black.cgColor
                    button.clipsToBounds = true
                }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func dayButtonTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
            
            if sender.isSelected {
                sender.backgroundColor = UIColor.black
                sender.tintColor = UIColor.white
            } else {
                sender.backgroundColor = UIColor.clear
                sender.tintColor = UIColor.black
            }
    }
    
}
