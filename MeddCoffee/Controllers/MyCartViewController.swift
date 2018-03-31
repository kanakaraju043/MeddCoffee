//
//  MyCartViewController.swift
//  MeddCoffee
//
//  Created by KANAKARAJU GANDREDDI on 2/17/18.
//  Copyright © 2018 com.appinov.meddCoffee. All rights reserved.
//

import UIKit

class MyCartViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var stepperView: PSProfileStepper!
    var index: Int16 = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My Cart"
        cartTableView.register(UINib(nibName: "MyCartTableViewCell", bundle: nil), forCellReuseIdentifier: "cartItemCell")
        self.stepperView.setIndex(UInt(index), animated: true)
        cartTableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if AppDelegate.productArray.count>0{
            return AppDelegate.productArray.count
        }
    
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "cartItemCell") as? MyCartTableViewCell
            let cartItem = AppDelegate.productArray[indexPath.row]
            cell?.cartProductImageView.image = UIImage(named: cartItem.productIcon!)
            cell?.cartProductName.text = cartItem.productName
            return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 250
    }
    
}
