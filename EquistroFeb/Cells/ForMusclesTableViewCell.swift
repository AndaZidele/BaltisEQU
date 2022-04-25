//
//  ForMusclesTableViewCell.swift
//  EquistroFeb
//
//  Created by Arta Zidele on 07/02/2022.
//

import UIKit

class ForMusclesTableViewCell: UITableViewCell {

    
    @IBOutlet weak var musclesName: UILabel!
    @IBOutlet weak var musclesImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
