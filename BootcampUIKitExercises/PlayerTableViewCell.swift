//
//  PlayerTableViewCell.swift
//  BootcampUIKitExercises
//
//  Created by Jose Luis Escolá García on 9/3/24.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        title.layer.masksToBounds = true
        title.layer.cornerRadius = 10
        
        backgroundImage.layer.masksToBounds = true
        backgroundImage.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
