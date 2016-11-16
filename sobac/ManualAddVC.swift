//
//  ManualAddVC.swift
//  sobac
//
//  Created by Daniel Porter on 11/13/16.
//  Copyright © 2016 Daniel Porter. All rights reserved.
//

import UIKit

class ManualAddVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let pickOptions = ["0", "1", "2", "3", "4", "5", "6", "7"]
    
    let tempBac = BAC.sharedInstance
    var defaults = UserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.beerPicker.dataSource = self
        self.shotPicker.dataSource = self
        self.winePicker.dataSource = self
        self.beerPicker.delegate = self
        self.shotPicker.delegate = self
        self.winePicker.delegate = self
        
        addButton.layer.cornerRadius = 5
        cancelButton.layer.cornerRadius = 5
        
        defaults.synchronize()
    }
    
    @IBAction func donePress(_ sender: AnyObject) {
        //These numbers will be replaced by user-defined numbers later
        tempBac.A += 12 * 0.05 * Double(beerPicker.selectedRow(inComponent: 0))
        tempBac.A += 5 * 0.12 * Double(beerPicker.selectedRow(inComponent: 0))
        tempBac.A += 1.5 * 0.40 * Double(beerPicker.selectedRow(inComponent: 0))
        
        if (defaults.object(forKey: "Gender") != nil) {
            tempBac.gender = defaults.integer(forKey: "Gender")
        } else {
            tempBac.gender = 0
            defaults.set(0, forKey: "Gender")
        }

        if (defaults.object(forKey: "Weight") != nil) {
            tempBac.W = defaults.double(forKey: "Weight")
        } else {
            tempBac.W = 140.0
            defaults.set(140.0, forKey: "Weight")
        }
        
        tempBac.calcBAC()
    }
    
    @IBAction func cancelPress(_ sender: AnyObject) {
        //Maybe increment the time here
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 8
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickOptions[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: pickOptions[row], attributes: [NSForegroundColorAttributeName : UIColor.lightGray])
    }
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var beerPicker: UIPickerView!
    @IBOutlet weak var shotPicker: UIPickerView!
    @IBOutlet weak var winePicker: UIPickerView!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
