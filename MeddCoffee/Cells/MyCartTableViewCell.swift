//
//  MyCartTableViewCell.swift
//  MeddCoffee
//
//  Created by KANAKARAJU GANDREDDI on 2/17/18.
//  Copyright © 2018 com.appinov.meddCoffee. All rights reserved.
//

import UIKit

class MyCartTableViewCell: UITableViewCell {

    @IBOutlet weak var cartProductImageView: UIImageView!
    @IBOutlet weak var cartProductName: UILabel!
    
    @IBOutlet weak var cartgramButton: UIButton!
    
    @IBOutlet weak var strikeLabel: UILabel!
    @IBOutlet weak var quantityButton: UIButton!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var offerLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        quantityButton.layer.cornerRadius = quantityButton.frame.size.height/2
        quantityButton.layer.masksToBounds = true
        quantityButton.layer.borderWidth = 1
        quantityButton.layer.borderColor = UIColor.white.cgColor
        
        cartgramButton.layer.cornerRadius = cartgramButton.frame.size.height/2
        cartgramButton.layer.masksToBounds = true
        cartgramButton.layer.borderWidth = 1
        cartgramButton.layer.borderColor = UIColor.white.cgColor
        
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: strikeLabel.text!)
        attributeString.addAttribute(NSAttributedStringKey.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        strikeLabel.attributedText = attributeString

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
