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
        let tag = sender.tag
        for button in dayButtons{
            if button.tag == tag{
                button.backgroundColor = UIColor.black
                button.setTitleColor(.white, for: .normal)
            }
            else{
                //stays the same
            }
        }
    }
    
}
