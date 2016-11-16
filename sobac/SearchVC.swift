//
//  SearchVC.swift
//  sobac
//
//  Created by Nate Henry on 11/13/16.
//  Copyright © 2016 Nate Henry. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {

    @IBOutlet weak var nameSwitch: UISwitch!
    @IBOutlet weak var ingredientSwitch: UISwitch!
    @IBOutlet weak var searchTextLabel: UITextField!
    
    @IBAction func nameSwitchTap(_ sender: AnyObject) {
        if(ingredientSwitch.isOn){
            ingredientSwitch.setOn(false, animated: true)
        } else {
            ingredientSwitch.setOn(true, animated: true)
        }
    }
    
    @IBAction func ingredientSwitchTap(_ sender: AnyObject) {
        if(nameSwitch.isOn){
            nameSwitch.setOn(false, animated: true)
        } else {
            nameSwitch.setOn(true, animated: true)
        }
    }
    
    @IBAction func fromTable(_ segue: UIStoryboardSegue) {
        let child = (segue.source as! CocktailTableVC)
        child.dismiss(animated: true, completion: nil)
        viewDidLoad()
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
        
        if(segue.identifier == "searchResults"){
        
            let child = (segue.destination as! CocktailTableVC)
        
        
            child.searchString = searchTextLabel.text
        
            if(nameSwitch.isOn){
                child.nameSearch = true
                child.ingredientSearch = false
            } else {
                child.nameSearch = false
                child.ingredientSearch = true
            }
        }
    }
 

}
