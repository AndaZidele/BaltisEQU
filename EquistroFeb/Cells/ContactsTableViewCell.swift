//
//  ContactsTableViewCell.swift
//  EquistroFeb
//
//  Created by Arta Zidele on 08/02/2022.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {

    @IBOutlet weak var valstsLabel: UILabel!
    @IBOutlet weak var callButton: UIButton!
    
    @IBOutlet weak var fonsValstim: UIImageView!
    @IBOutlet weak var sendAnEmail: UIButton!
    @IBOutlet weak var makeACall: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
