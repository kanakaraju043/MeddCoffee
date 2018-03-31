//
//  MenuTableViewCell.swift
//  MeddCoffee
//
//  Created by KANAKARAJU GANDREDDI on 2/16/18.
//  Copyright © 2018 com.appinov.meddCoffee. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var menuImageView: UIImageView!
    
    @IBOutlet weak var menuItemLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
