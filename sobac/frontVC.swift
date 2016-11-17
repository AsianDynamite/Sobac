//
//  frontVC.swift
//  sobac
//
//  Created by Daniel Porter on 11/11/16.
//  Copyright © 2016 Daniel Porter. All rights reserved.
//

import UIKit

class frontVC: UIViewController {
    
    var currentBAC = BAC.sharedInstance
    var defaults = UserDefaults()
    var limit: Double!
    let observer = bacObserver()
    
    var formatter = NumberFormatter()
    var percentFormatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentBAC.addObserver(observer, forKeyPath: "A", options: .new, context: nil)
        
        // Do any additional setup after loading the view.
        gearButton.layer.cornerRadius = 5
        
        formatter.numberStyle = .decimal
        formatter.minimumSignificantDigits = 2
        formatter.maximumSignificantDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.usesSignificantDigits = true
        
        percentFormatter.numberStyle = .percent
        
        if (defaults.object(forKey: "Limit") != nil) {
            limit = defaults.double(forKey: "Limit")
            limitText.text = "Limit: " + formatter.string(for: limit)! + "%"
        } else {
            limit = 0.08
            limitText.text = "Limit: " + formatter.string(for: limit)! + "%"
        }
        
        currentBAC.calcBAC()

        if(limit > 0.0) {
            let progress = currentBAC.bloodAlcoholContent / limit
            if(progress < 0.5) {
                progressCircle.progress = progress
                progressCircle.trackFillColor = UIColor.green
            } else if(progress < 0.8) {
                progressCircle.progress = progress
                progressCircle.trackFillColor = UIColor.yellow
            } else if(progress < 1.0) {
                progressCircle.progress = progress
                progressCircle.trackFillColor = UIColor.red
            } else {
                progressCircle.trackFillColor = UIColor.red
                progressCircle.progress = 1.0
            }
            bacPercentLabel.text = formatter.string(for: currentBAC.bloodAlcoholContent)! + "%"
        } else {
            progressCircle.progress = 0.0
            bacPercentLabel.text = formatter.string(for: currentBAC.bloodAlcoholContent)! + "%"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func done(_ segue: UIStoryboardSegue) {
        if(segue.identifier == "returnFromSettings") {
            let child = (segue.source as! SettingsVC)
            
            limitText.text = "Limit: " + formatter.string(for: child.limit)! + "%"
            viewDidLoad()
        } else if(segue.identifier == "returnFromAdding") {
            viewDidLoad()
        }
    }
    
    @IBOutlet weak var bacPercentLabel: UILabel!
    @IBOutlet weak var limitText: UILabel!
    @IBOutlet weak var gearButton: UIButton!
    @IBOutlet var rightSwipe: UISwipeGestureRecognizer!
    @IBOutlet var leftSwipe: UISwipeGestureRecognizer!
    @IBOutlet weak var progressCircle: CircleProgressView!
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
