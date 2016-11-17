//
//  FriendVC.swift
//  sobac
//
//  Created by Andrew Henry on 11/15/16.
//  Copyright © 2016 Daniel Porter. All rights reserved.
//

import UIKit

class FriendVC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var BAClimitLabel: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var CircleProgression: CircleProgressView!
    
    var name: String!
    var limit: String!
    var percentage: String!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
        BAClimitLabel.text = limit
        percentageLabel.text = percentage + "%"
        CircleProgression.progress = Double(percentage)!/Double(limit)!
        
        // Do any additional setup after loading the view.
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
