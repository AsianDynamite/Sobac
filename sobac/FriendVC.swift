//
//  FriendVC.swift
//  sobac
//
//  Created by Andrew Henry on 11/15/16.
//  Copyright © 2016 Daniel Porter. All rights reserved.
//

import UIKit

class FriendVC: UIViewController {

    @IBOutlet weak var friendLabel: UILabel!
    @IBOutlet weak var limitLabel: UILabel!
    @IBOutlet weak var BACPercentage: UILabel!
    @IBOutlet weak var BACProgression: CircleProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
