//
//  RewardsViewController.swift
//  MeddCoffee
//
//  Created by KANAKARAJU GANDREDDI on 2/17/18.
//  Copyright © 2018 com.appinov.meddCoffee. All rights reserved.
//

import UIKit

@available(iOS 10.0, *)
class RewardsViewController: UIViewController
{
    @IBOutlet weak var viewProcess: ProcessLoadingView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var redeemButtonAction: UIButton!
    var options = ProcessOptions()
    let colorBlue = UIColor(displayP3Red: 100/255, green: 217/255, blue: 213/255, alpha: 1)
    let colorOrange = UIColor(displayP3Red: 191/255, green: 155/255, blue: 124/255, alpha: 1)
    let bgColor = UIColor(displayP3Red: 82/255, green: 75/255, blue: 96/255, alpha: 1)
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "My Rewards"

        redeemButtonAction.layer.cornerRadius = redeemButtonAction.frame.size.height/2
        redeemButtonAction.layer.masksToBounds = true
        redeemButtonAction.layer.borderWidth = 1
        redeemButtonAction.layer.borderColor = UIColor.brown.cgColor
        
        let step = AppDelegate.transactionCount
        let totalSteps = 6
        
        let curvesStartRadians = [(3 * CGFloat.pi)/2, (23 * CGFloat.pi) / 12, (CGFloat.pi / 3), ((2 * CGFloat.pi) / 3), (13 * CGFloat.pi) / 12]
        let curvesEndRadians   = [(23 * CGFloat.pi) / 12, (CGFloat.pi) / 3, (2 * CGFloat.pi) / 3, (13 * CGFloat.pi) / 12, (3 * CGFloat.pi)/2]
        
        options.curvesStartRadians = curvesStartRadians
        options.curvesEndRadians = curvesEndRadians
        options.setNumberOfItems(number: totalSteps)
        options.stepComplete = step
        
        options.inSpeed = 1.2
        options.images = imageOpts(of: step, totalSteps: totalSteps)
        options.mainTextfont = UIFont.boldSystemFont(ofSize: 18)
        options.subTextfont = UIFont.boldSystemFont(ofSize: 14)
        options.ItemSize = 30
        options.radius = 120
        options.bgColor = UIColor.white
        options.completedPathColor = colorBlue
        options.mainTextColor = .green
        options.subTextColor = UIColor.brown
        
        viewProcess.options = options
        
        countLabel.text = "\(AppDelegate.transactionCount)/6"
        
        let popupView = Bundle.main.loadNibNamed("PopUpView", owner: self, options: nil)![0] as? UIView

        popupView?.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        if AppDelegate.transactionCount == 6{
            AppDelegate.transactionCount = 0; UIApplication.shared.keyWindow?.addSubview(popupView!)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
    
        options.mainText = "Get free MedCoffe "
        options.subText = "on every 6th transaction"
        viewProcess.start(completed:
            {
                print("done")
        })
    }
    
    func imageOpts(of stepNumber:Int, totalSteps:Int) ->[(UIImage, UIColor?)]
    {
        var optsImages = [(UIImage, UIColor?)]()
        for i in 0 ..< totalSteps
        {
            if stepNumber > i
            {
                optsImages.append((ImageUtil.drawText("\(i+1)", in: #imageLiteral(resourceName: "emptyCircle"), at: CGPoint(x: 0, y: 0)), colorBlue))
            }
            else if stepNumber == i
            {
                optsImages.append((#imageLiteral(resourceName: "emptyCircle"), colorOrange))
            }
            else
            {
                optsImages.append((#imageLiteral(resourceName: "emptyCircle"), UIColor.gray))
            }
        }
        return optsImages
    }

    
    @IBAction func redeemButtonAction(_ sender: Any) {
        
        
    }
    
}
