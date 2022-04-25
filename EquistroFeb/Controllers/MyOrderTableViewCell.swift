//
//  MyOrderTableViewCell.swift
//  EquistroFeb
//
//  Created by Arta Zidele on 16/03/2022.
//

import UIKit

class MyOrderTableViewCell: UITableViewCell {

    @IBOutlet weak var skaitsLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
