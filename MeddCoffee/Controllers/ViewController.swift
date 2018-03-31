//
//  ViewController.swift
//  MeddCoffee
//
//  Created by KANAKARAJU GANDREDDI on 2/16/18.
//  Copyright © 2018 com.appinov.meddCoffee. All rights reserved.
//

import UIKit

class ViewController: UIViewController,SideMenuDelegate,UIGestureRecognizerDelegate,UICollectionViewDataSource {
    
    var sideMenuController: SideMenuViewController?
    var productArray = [ProductItemsModel]()
    let columns: CGFloat = 2.0
    let lineSpace: CGFloat = 8.0
    let inset: CGFloat = 8.0
    let space: CGFloat = 8.0
    
    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Products"

        let productOne = ProductItemsModel(pid: 100, productName: "GreenCoffee", productDescription: "The Flavor Wheel glossary", productPrice: "44 SAR", productIcon:"coffee_tweleve")
        let productTwo = ProductItemsModel(pid: 101, productName: "BruCoffee", productDescription: "GreenCoffee", productPrice: "22 SAR", productIcon: "coffee_two")
        let productThree = ProductItemsModel(pid: 102, productName: "PuppyCoffee", productDescription: "GreenCoffee", productPrice: "66 SAR", productIcon: "coffee_three")
        let productFour = ProductItemsModel(pid: 104, productName: "GreenCoffee", productDescription: "GreenCoffee", productPrice: "76 SAR", productIcon: "coffee_eight")
        let productFive = ProductItemsModel(pid: 105, productName: "GreenCoffee", productDescription: "The Flavor Wheel glossary", productPrice: "54 SAR", productIcon: "coffee_fourteen")
        let productSix = ProductItemsModel(pid: 106, productName: "LemonCoffee", productDescription: "GreenCoffee", productPrice: "87 SUA", productIcon: "coffee_six")
        let productSeven = ProductItemsModel(pid: 107, productName: "BombayCoffee", productDescription: "GreenCoffee", productPrice: "98 SAR", productIcon: "coffee_fourteen")
        let productEight = ProductItemsModel(pid: 108, productName: "SaveCoffee", productDescription: "GreenCoffee", productPrice: "42 SAR", productIcon: "coffee_three")
        let productNine = ProductItemsModel(pid: 109, productName: "GreenCoffee", productDescription: "GreenCoffee", productPrice: "78 SAR", productIcon: "coffee_seven")
        let productTen = ProductItemsModel(pid: 110, productName: "RedCoffee", productDescription: "GreenCoffee", productPrice: "98 SAR", productIcon: "coffee_four")
        let productEleven = ProductItemsModel(pid: 111, productName: "PurpleCoffee", productDescription: "The Flavor Wheel glossary", productPrice: "SAR", productIcon: "coffee_eight")
        let productTwelve = ProductItemsModel(pid: 112, productName: "OrangeCoffee", productDescription: "GreenCoffee", productPrice: "23 SAR", productIcon: "coffee_six")
        let productThirteen = ProductItemsModel(pid: 113, productName: "GreenCoffee", productDescription: "GreenCoffee", productPrice: "42 SAR", productIcon: "coffee_five")
        let productFourteen = ProductItemsModel(pid: 114, productName: "YellowCoffee", productDescription: "The Flavor Wheel glossary", productPrice: "72 SAR", productIcon: "coffee_nine")
        let productFifteen = ProductItemsModel(pid: 115, productName: "BlakCoffee", productDescription: "GreenCoffee", productPrice: "72 SAR", productIcon: "coffee_tweleve")

        productArray = [productOne,productTwo,productThree,productFour,productFive,productSix,productSeven,productEight,productNine,productTen,productEleven,productTwelve,productThirteen,productFourteen,productFifteen]
        
        sideMenuController = self.storyboard?.instantiateViewController(withIdentifier: "sidemenu") as? SideMenuViewController
        sideMenuController?.sideMenuDelegate = self
        
        let swipeRigth =  UISwipeGestureRecognizer(target: self, action: #selector(self.respondsToGuesture))
        swipeRigth.delegate = self
        swipeRigth.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRigth)
        
        let tapGuesture =  UITapGestureRecognizer(target: self, action: #selector(repsondsTapGuesture))
        tapGuesture.delegate = self
        tapGuesture.numberOfTapsRequired = 1
        self.sideMenuController?.view.addGestureRecognizer(tapGuesture)
        
    }
    
    @objc func repsondsTapGuesture() {
        hideSideMenu()
    }
    @objc func respondsToGuesture(guesture: UISwipeGestureRecognizer) {
        
        switch guesture.direction {
        case UISwipeGestureRecognizerDirection.right:
            showSideMenu()
            
        case UISwipeGestureRecognizerDirection.left:
            hideSideMenu()
            
        default:
            break
        }
    }
    
    @IBAction func toggleAction(_ sender: Any) {
        
        if AppDelegate.isSideMenuShown{
            showSideMenu()
        }else{
            hideSideMenu()
        }
        
    }
    
    func showSideMenu() {
        
        UIView.animate(withDuration: 0.3) {
            self.sideMenuController?.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            self.sideMenuController?.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            UIApplication.shared.keyWindow?.addSubview((self.sideMenuController?.view)!)
            AppDelegate.isSideMenuShown = false
        }
        
    }
    
    
    @IBAction func addToCart(_ sender: Any) {
    
    
    }
    
    func hideSideMenu() {
        UIView.animate(withDuration: 0.3, animations: {
            self.sideMenuController?.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            
        }) { (finished) in
            self.sideMenuController?.view.removeFromSuperview()
        }
        AppDelegate.isSideMenuShown = true
    }
    
    func sideMenuSelectedMenuItemType(menuType: MenuItemType) {
         
        hideSideMenu()
        switch menuType {
        case .profile:
            let profileViewController = storyboard?.instantiateViewController(withIdentifier: "profile") as? ProfileViewController
            self.navigationController?.pushViewController(profileViewController!, animated: true)
        case .home:
            
            print("Product ViewController")
            
        case .categories:
            let categoryViewController = storyboard?.instantiateViewController(withIdentifier: "category") as? CategoryViewController
            self.navigationController?.pushViewController(categoryViewController!, animated: true)
            
        case .myOrders:
            let orderViewController = storyboard?.instantiateViewController(withIdentifier: "order") as? MyOrdersViewController
            self.navigationController?.pushViewController(orderViewController!, animated: true)
            
        case .rewards:
            let rewardsViewController = storyboard?.instantiateViewController(withIdentifier: "reward") as? RewardsViewController
            self.navigationController?.pushViewController(rewardsViewController!, animated: true)
            
        case .myCart:
            let cartViewController = storyboard?.instantiateViewController(withIdentifier: "cart") as? MyCartViewController
            self.navigationController?.pushViewController(cartViewController!, animated: true)
            
            
        case .favourites:
            let favouriteViewController = storyboard?.instantiateViewController(withIdentifier: "favourite") as? FavouritesViewController
            self.navigationController?.pushViewController(favouriteViewController!, animated: true)
            
        case .myWallet:
            let walletViewController = storyboard?.instantiateViewController(withIdentifier: "wallet") as? MyWalletViewController
            self.navigationController?.pushViewController(walletViewController!, animated: true)
            
        case .notification:
            let notificationViewController = storyboard?.instantiateViewController(withIdentifier: "notification") as? NotificationViewController
            self.navigationController?.pushViewController(notificationViewController!, animated: true)
            
        default:
            break
        }
 
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (sideMenuController?.sidemenuTableView.bounds.contains(touch.location(in: sideMenuController?.sidemenuTableView)))! {
            return false
        }
        return true
    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.productArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productItemCell", for: indexPath) as! ProductCollectionViewCell
        let dataItem = productArray[indexPath.item]
        cell.productItemImageView.image = UIImage(named: dataItem.productIcon!)
        cell.productItemNameLabel.text = dataItem.productName
        cell.productItemPriceLabel.text = dataItem.productPrice
        
        return cell
    }
}


// MARK: UICollectionViewDelegate

extension ViewController: UICollectionViewDelegate{
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let data = productArray[indexPath.row]
        performSegue(withIdentifier: "productDetials", sender: data)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "productDetials" {
            let destinationController  = segue.destination as! ProductItemDetailViewController
            destinationController.productData = sender as? ProductItemsModel
        }
    }
}

// MARK: UICollectionViewDelegateFlowLayout

extension ViewController: UICollectionViewDelegateFlowLayout{
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        let width = Int((collectionView.frame.width/columns) - (inset+space))
        return CGSize(width: width ,height: width)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        
        return UIEdgeInsets(top: inset , left: inset ,bottom: inset , right: inset)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        
        return lineSpace
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        
        return space
    }
    
}
