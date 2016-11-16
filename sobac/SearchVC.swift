//
//  SearchVC.swift
//  sobac
//
//  Created by Daniel Porter on 11/13/16.
//  Copyright © 2016 Daniel Porter. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {

    @IBOutlet weak var nameSwitch: UISwitch!
    @IBOutlet weak var ingredientSwitch: UISwitch!
    @IBOutlet weak var searchTextLabel: UITextField!
    
    @IBAction func nameSwitchTap(_ sender: AnyObject) {
        ingredientSwitch.setOn(false, animated: true)
    }
    
    @IBAction func ingredientSwitchTap(_ sender: AnyObject) {
        nameSwitch.setOn(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let child = (segue.destination as! CocktailTableVC)
        child.seachString = searchTextLabel.text
        
        if(nameSwitch.isOn){
            child.nameSearch = true
            child.ingredientSearch = false
        } else {
            child.nameSearch = false
            child.ingredientSearch = true
        }
    }
 

}
