//
//  ProductItemDetailViewController.swift
//  MeddCoffee
//
//  Created by KANAKARAJU GANDREDDI on 2/17/18.
//  Copyright © 2018 com.appinov.meddCoffee. All rights reserved.
//

import UIKit

class ProductItemDetailViewController: UIViewController {
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var productItemImageView: UIImageView!
    @IBOutlet weak var productItemNameLabel: UILabel!
    @IBOutlet weak var productItemDescriptionLabel: UILabel!
    @IBOutlet weak var productItemPriceLabel: UILabel!
    var productArray = [ProductItemsModel]()
    var productData: ProductItemsModel?
    @IBOutlet weak var strikeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Product Info"
        bottomView.layer.borderColor = UIColor.brown.cgColor
        if let productData = productData {
            self.productItemImageView.image = UIImage(named: productData.productIcon!)
            self.productItemNameLabel.text = productData.productName
            self.productItemDescriptionLabel.text = productData.productDescription
            self.productItemPriceLabel.text = productData.productPrice
            
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: strikeLabel.text!)
            attributeString.addAttribute(NSAttributedStringKey.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
            strikeLabel.attributedText = attributeString
        }

        
    }
    @IBAction func addToCartAction(_ sender: Any) {

        AppDelegate.productArray.append(productData!)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    @IBAction func BuyProductAction(_ sender: Any) {
        
        AppDelegate.transactionCount = AppDelegate.transactionCount+1
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
