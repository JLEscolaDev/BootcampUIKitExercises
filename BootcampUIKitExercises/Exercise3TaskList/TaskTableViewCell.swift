//
//  TableViewCell.swift
//  BootcampUIKitExercises
//
//  Created by Jose Luis Escolá García on 9/3/24.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var completedTaskSwitch: UISwitch!
    
    var delegate : SwitchDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func switchStateChanged(_ sender: UISwitch) {
        delegate?.switchStateChanged(self, newState: sender.isOn)
    }
    
}

protocol SwitchDelegate {
    func switchStateChanged<T: UITableViewCell>(_ cell: T, newState: Bool)
}
