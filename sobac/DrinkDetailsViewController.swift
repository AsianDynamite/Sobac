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
        let request = URLRequest(url : url!)
        drinkWebView.loadRequest(request)
        //activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        //activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        //activityIndicator.startAnimating()
    }
    
    //func webViewDidFinishLoad(webView : UIWebView) {
        //UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        //activityIndicator.stopAnimating()
    //}

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
