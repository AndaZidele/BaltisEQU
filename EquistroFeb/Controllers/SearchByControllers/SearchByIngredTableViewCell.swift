//
//  SearchByIngredTableViewCell.swift
//  EquistroFeb
//
//  Created by Arta Zidele on 09/03/2022.
//

import UIKit

class SearchByIngredTableViewCell: UITableViewCell {
    @IBOutlet weak var ingredName: UILabel!
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var ingredImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
