//
//  PopUpView.swift
//  MeddCoffee
//
//  Created by KANAKARAJU GANDREDDI on 2/18/18.
//  Copyright © 2018 com.appinov.meddCoffee. All rights reserved.
//

import UIKit

class PopUpView: UIView {

    @IBOutlet weak var popView: UIView!
    @IBAction func closeButtonAction(_ sender: Any) {
        
        self.removeFromSuperview()
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
