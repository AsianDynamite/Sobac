//
//  DrinkDetailsViewController.swift
//  sobac
//
//  Created by Nate Henry on 11/15/16.
//  Copyright © 2016 Nate Henry. All rights reserved.
//

import UIKit

class DrinkDetailsViewController: UIViewController {
    
    var drinkID : String!

    @IBOutlet weak var drinkWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let url = URL(string: "http://www.thecocktaildb.com/drink.php?c=" + drinkID!)
        let request = URLRequest(url : url!)
        drinkWebView.loadRequest(request)
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
