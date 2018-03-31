//
//  CategoryViewController.swift
//  MeddCoffee
//
//  Created by KANAKARAJU GANDREDDI on 2/17/18.
//  Copyright © 2018 com.appinov.meddCoffee. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var categoryItemTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My Categories"

        categoryItemTableView.register(UINib(nibName: "ProductCategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "categoryItemCell")
        categoryItemTableView.tableFooterView = UIView()
    }

    // MARK: - UITableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if AppDelegate.productArray.count>0{
            return AppDelegate.productArray.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryItemCell") as? ProductCategoryTableViewCell
        
        let cartItem = AppDelegate.productArray[indexPath.row]
        cell?.categoryItemImageView.image = UIImage(named: cartItem.productIcon!)
        
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 150
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
