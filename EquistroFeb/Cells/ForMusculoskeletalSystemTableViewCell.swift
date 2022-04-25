//
//  ForMusculoskeletalSystemTableViewCell.swift
//  EquistroFeb
//
//  Created by Arta Zidele on 04/02/2022.
//

import UIKit

class ForMusculoskeletalSystemTableViewCell: UITableViewCell {

    
    @IBOutlet weak var FMSname: UILabel!
    
    @IBOutlet weak var FMSimage: UIImageView!
    
    @IBOutlet weak var FMSbutton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
