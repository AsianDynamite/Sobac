//
//  SettingsVC.swift
//  sobac
//
//  Created by Daniel Porter on 11/15/16.
//  Copyright © 2016 Daniel Porter. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {
    
    let limitWarnings = [["•Average individual appears normal"], ["•Decreased inhibition", "•Mild euphoria", "•Loss of concentration"], ["•Blunted feelings", "•Reduced sensitivity to pain", "•Extroversion", "•Loss of Reasoning", "•Loss of Depth Perception"], ["•Slower reflexes", "•Possibility of nausea and vomiting", "•Boisterousness", "•Slurred Speech"], ["•Vomiting", "•Emotional swings", "•Memory blackout", "•Impaired sensations"]]
    
    var defaults = UserDefaults()
    
    var age:Int = 0
    var gender:Int = 0 //0 for male, 1 for female
    var limit:Double = 0.08
    var weight:Double = 140.0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        if (defaults.object(forKey: "Limit") != nil) {
            limit = defaults.double(forKey: "Limit")
            limitSlider.value = Float(limit)
            limitChanged(Any.self)
        } else {
            limit = 0.08
            defaults.set(0.08, forKey: "Limit")
            limitSlider.value = 0.08
            limitChanged(Any.self)
        }
        if (defaults.object(forKey: "Gender") != nil) {
            gender = defaults.integer(forKey: "Gender")
            if(gender == 0) {
                genderSelector.selectedSegmentIndex = 0
            } else {
                genderSelector.selectedSegmentIndex = 1
            }
        } else {
            gender = 0
            defaults.set(0, forKey: "Gender")
            genderSelector.selectedSegmentIndex = 0
        }
        if (defaults.object(forKey: "Weight") != nil) {
            weight = defaults.double(forKey: "Weight")
            weightInput.text = String(weight)
        } else {
            weight = 140.0
            defaults.set(140.0, forKey: "Weight")
            weightInput.text = ("140.0")
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        weightInput.endEditing(true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func genderChanged(_ sender: Any) {
        defaults.set(genderSelector.selectedSegmentIndex, forKey: "Gender")
        
        defaults.synchronize()
    }
    
    @IBAction func changeWeight(_ sender: Any) {
        defaults.set(Double(weightInput.text!), forKey: "Weight")
        
        defaults.synchronize()
    }
    
    @IBAction func limitChanged(_ sender: Any) {
        defaults.set(Double(limitSlider.value), forKey: "Limit")
        
        var output = ""
        var warningSet = 0
        
        if(limitSlider.value <= 0.029) {
            warningSet = 0
        } else if (limitSlider.value <= 0.059) {
            warningSet = 1
        } else if (limitSlider.value <= 0.099) {
            warningSet = 2
        } else if (limitSlider.value <= 0.199) {
            warningSet = 3
        } else if (limitSlider.value <= 0.299) {
            warningSet = 4
        }
        
        for line in limitWarnings[warningSet] {
            output += line + "\n"
        }
        
        limitLabel.text = String(limitSlider.value)
        
        limitText.text = output
        
        defaults.synchronize()
    }
    
    @IBAction func clearDefaults(_ sender: Any) {
        defaults.removeObject(forKey: "Gender")
        defaults.removeObject(forKey: "Weight")
        defaults.removeObject(forKey: "Limit")
        defaults.removeObject(forKey: "StartTime")
        defaults.synchronize()
        viewDidLoad()
        limitChanged(Any.self)
    }
    
    @IBOutlet weak var limitText: UILabel!
    @IBOutlet weak var limitSlider: UISlider!
    @IBOutlet weak var limitLabel: UILabel!
    @IBOutlet weak var weightInput: UITextField!
    @IBOutlet weak var genderSelector: UISegmentedControl!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
