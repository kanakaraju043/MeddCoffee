//
//  SideMenuViewController.swift
//  MeddCoffee
//
//  Created by KANAKARAJU GANDREDDI on 2/16/18.
//  Copyright © 2018 com.appinov.meddCoffee. All rights reserved.
//

import UIKit

enum MenuItemType: String{
    case profile
    case home
    case categories
    case myOrders
    case rewards
    case myCart
    case favourites
    case myWallet
    case notification
    case none
    
    init(menuItem:Int){
        
        switch menuItem {
        case 0: self = .profile
        case 1: self = .home
        case 2: self = .categories
        case 3: self = .myOrders
        case 4: self = .rewards
        case 5: self = .myCart
        case 6: self = .favourites
        case 7: self = .myWallet
        case 8: self = .notification
        case 9: self = .none
        default: self = .none
            
        }
    }
    
}
protocol SideMenuDelegate {
    
    func sideMenuSelectedMenuItemType(menuType: MenuItemType)
}

class SideMenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var sidemenuTableView: UITableView!
    var itemsArray: [[String:String]] = [[ : ]]
    let itemsOneDictionary = ["itemName":"Profile","itemIcon":"profile"]
    let itemsTwoDictionary = ["itemName":"Home","itemIcon":"home"]
    let itemsThreeDictionary = ["itemName":"Categories","itemIcon":"coffee"]
    let itemsFourDictionary = ["itemName":"MyOrders","itemIcon":"order"]
    let itemsFiveDictionary = ["itemName":"Rewards","itemIcon":"reward"]
    let itemsSixDictionary = ["itemName":"MyCart","itemIcon":"cart"]
    let itemsSevenDictionary = ["itemName":"MyWallet","itemIcon":"wallet"]
    let itemsEightDictionary = ["itemName":"Notification","itemIcon":"notification"]
    let itemsNineDictionary = ["itemName":"Favourites","itemIcon":"favourite"]
    var sideMenuDelegate:SideMenuDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemsArray = [itemsOneDictionary,itemsTwoDictionary,itemsThreeDictionary,itemsFourDictionary,itemsFiveDictionary,itemsSixDictionary,itemsNineDictionary,itemsSevenDictionary,itemsEightDictionary]
        sidemenuTableView.register(UINib(nibName: "ProfileTableViewCell", bundle: nil), forCellReuseIdentifier: "profileItemCell")
        sidemenuTableView.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "menuItemCell")
        sidemenuTableView.delegate = self;
        sidemenuTableView.dataSource = self;
        sidemenuTableView.tableFooterView = UIView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - UITableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dict:NSDictionary = itemsArray[indexPath.row] as NSDictionary

        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "profileItemCell") as? ProfileTableViewCell
            cell?.profileNameLabel.text = "Kanakaraju Gandreddi"//dict.object(forKey: "itemName") as? String
            cell?.mobileNumberLabel.text = "7710074273"
            cell?.profileImageView.image = UIImage(named: (dict.object(forKey: "itemIcon") as? String)!)
           // cell?.settingsImageView.image = UIImage(named: "settings")
            return cell!

        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "menuItemCell") as? MenuTableViewCell
            cell?.menuItemLabel.text = dict.object(forKey: "itemName") as? String
            cell?.menuImageView.layer.cornerRadius = (cell?.menuImageView.frame.size.width)! / 2
            cell?.menuImageView.layer.borderWidth = 0
            cell?.menuImageView.layer.masksToBounds = true;
            cell?.menuImageView.image = UIImage(named: (dict.object(forKey: "itemIcon") as? String)!)
            return cell!

        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sideMenuDelegate?.sideMenuSelectedMenuItemType(menuType:MenuItemType(menuItem: indexPath.row))
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 130
        }else{
            return 60
        }
    }
    
    
}
