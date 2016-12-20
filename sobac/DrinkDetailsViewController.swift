//
//  DrinkDetailsViewController.swift
//  sobac
//
//  Created by Nate Henry on 11/15/16.
//  Copyright © 2016 Nate Henry. All rights reserved.
//

import UIKit

class DrinkDetailsViewController: UIViewController, drinkCalc, UIWebViewDelegate {
    
    var drinkID : String!
    var activityIndicator = UIActivityIndicatorView()

    @IBOutlet weak var drinkWebView: UIWebView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBAction func backButtonClick(_ sender: AnyObject) {
    }
    
    @IBAction func addDrinkClick(_ sender: AnyObject) {
        calculateBAC()
    }
    
    func calculateBAC() {
        let tempBac = BAC.sharedInstance
        let defaults = UserDefaults()
        
        if (defaults.object(forKey: "Ounces") != nil) {
            tempBac.A = defaults.double(forKey: "Ounces")
        } else {
            tempBac.A = 0.0
            defaults.set(0.0, forKey: "Ounces")
        }
        
        tempBac.A += 1.5 * 0.40
        
        defaults.set(tempBac.A, forKey: "Ounces")
        defaults.synchronize()
        
        tempBac.calcBAC()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let url = URL(string: "http://www.thecocktaildb.com/drink.php?c=" + drinkID!)
        drinkWebView.delegate = self
        let request = URLRequest(url : url!)
        drinkWebView.loadRequest(request)
        
        indicator.hidesWhenStopped = true
        
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        indicator.stopAnimating()
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
