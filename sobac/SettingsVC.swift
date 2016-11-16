//
//  SettingsVC.swift
//  sobac
//
//  Created by Daniel Porter on 11/15/16.
//  Copyright © 2016 Daniel Porter. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {
    
    var defaults = UserDefaults()
    
    var age:Int = 0
    var gender:Int = 0 //0 for male, 1 for female
    var limit:Double = 0.08
    var weight:Double = 140.0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if (defaults.object(forKey: "Age") != nil) {
            age = defaults.integer(forKey: "Age")
        } else {
            age = 21
            defaults.set(21, forKey: "Age")
        }
        if (defaults.object(forKey: "Limit") != nil) {
            limit = defaults.double(forKey: "Limit")
        } else {
            limit = 0.08
            defaults.set(0.08, forKey: "Limit")
        }
        if (defaults.object(forKey: "Gender") != nil) {
            gender = defaults.integer(forKey: "Gender")
        } else {
            gender = 0
            defaults.set(0, forKey: "Gender")
        }
        if (defaults.object(forKey: "Weight") != nil) {
            weight = defaults.double(forKey: "Weight")
        } else {
            weight = 140.0
            defaults.set(140.0, forKey: "Weight")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
