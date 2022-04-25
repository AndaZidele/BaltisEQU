//
//  HZProductsTableViewCell.swift
//  EquistroFeb
//
//  Created by Arta Zidele on 05/04/2022.
//

import UIKit

class HZProductsTableViewCell: UITableViewCell {

    @IBOutlet weak var hzproductsImg: UIImageView!
    @IBOutlet weak var hzproductsLabe: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
