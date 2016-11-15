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
    
    //Widmark's Formula
    //% BAC = (A x 5.14 / W x r) – .015 x H
    var A = 0.0 //Liquid ounces of alcohol consumed
    var W = 0.0 //Person's weight in pounds
    var r = [0.73, 0.66] //A gender constant of alcohol distribution (.73 for men and .66 for women)
    var H = 0.0 // Hours elapsed since drinking commenced
    
    var BAC = 0.0

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
        
        BAC = (A * 5.14 / W * r[1]) - 0.015 * H
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
