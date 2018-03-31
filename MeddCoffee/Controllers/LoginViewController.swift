//
//  LoginViewController.swift
//  MeddCoffee
//
//  Created by KANAKARAJU GANDREDDI on 2/17/18.
//  Copyright © 2018 com.appinov.meddCoffee. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.borderColor = UIColor.brown.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var loginButton: UIButton!
    @IBAction func loginButtonAction(_ sender: Any) {

        let viewController = storyboard?.instantiateViewController(withIdentifier: "homeVc") as? ViewController
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}
