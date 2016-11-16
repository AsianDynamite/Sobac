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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        gearButton.layer.cornerRadius = 5
        
        if (defaults.object(forKey: "Limit") != nil) {
            limit = defaults.double(forKey: "Limit")
            limitText.text = "Limit: " + String(limit) + "%"
        } else {
            limit = 0.08
            limitText.text = "Limit: " + String(limit) + "%"
        }
        
        currentBAC.calcBAC()

        
        if(limit > 0.0) {
            progressCircle.progress = currentBAC.bloodAlcoholContent / limit
            bacPercentLabel.text = String(currentBAC.bloodAlcoholContent / limit)
        } else {
            progressCircle.progress = 0.0
            bacPercentLabel.text = String(currentBAC.bloodAlcoholContent / limit)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func done(_ segue: UIStoryboardSegue) {
        if(segue.identifier == "returnFromSettings") {
            let child = (segue.source as! SettingsVC)
            
            limitText.text = "Limit: " + String(child.limit) + "%"
            child.dismiss(animated: true, completion: nil)
            viewDidLoad()
        } else if(segue.identifier == "returnFromAdding") {
            let child = (segue.source as! FriendTableVC)
            child.dismiss(animated: true, completion: nil)
            viewDidLoad()
        } else if (segue.identifier == "returnFromSearch"){
            let child = (segue.source as! SearchVC)
            child.dismiss(animated: true, completion: nil)
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
