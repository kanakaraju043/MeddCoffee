//
//  DataModel.swift
//  MeddCoffee
//
//  Created by KANAKARAJU GANDREDDI on 2/17/18.
//  Copyright © 2018 com.appinov.meddCoffee. All rights reserved.
//

import Foundation

class MenuItemsModel: NSObject {
    
}

class ProductItemsModel: NSObject {
    var  productId: Int?
    var  productName: String?
    var  productDescription: String?
    var  productPrice: String?
    var  productIcon: String?
    
    init(pid: Int?,productName: String?,productDescription: String?,productPrice: String?,productIcon: String?) {
        
        self.productId = pid
        self.productName = productName
        self.productDescription = productDescription
        self.productPrice = productPrice
        self.productIcon = productIcon
        
    }
    
    
}
