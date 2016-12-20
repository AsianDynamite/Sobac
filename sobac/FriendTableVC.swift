//
//  FriendTableVC.swift
//  sobac
//
//  Created by Daniel Porter on 11/13/16.
//  Copyright © 2016 Daniel Porter. All rights reserved.
//

import UIKit

class FriendTableVC: UITableViewController {
    
    var row = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let friendsRepo = FriendRepository.sharedInstance
        
        let friend1 = Friend(name: "Dan",limitBAC: "0.25",currentBAC: "0.27",personalImage: "Danp.jpg")
        let friend2 = Friend(name: "Nate",limitBAC: "0.10",currentBAC: "0.05",personalImage: "NateH.jpg")
        let friend3 = Friend(name: "Drew",limitBAC: "0.08",currentBAC: "0.11",personalImage:  "DrewH.jpg")
        
        friendsRepo.addFriend(newFriend: friend1)
        friendsRepo.addFriend(newFriend: friend2)
        friendsRepo.addFriend(newFriend: friend3)
        friendsRepo.save()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }
    
    @IBAction func backToFriends(_ segue: UIStoryboardSegue) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let friendsRepo = FriendRepository.sharedInstance
        return friendsRepo.friendsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friend", for: indexPath) as! FriendCell
        let friendsRepo = FriendRepository.sharedInstance
        let friend = friendsRepo.friendsArray[(indexPath as NSIndexPath).row]
        cell.nameLabel.text = friend.name
        cell.currentLabel.text = friend.currentBAC
        cell.limitLabel.text = friend.limitBAC
        cell.friendImage.image = UIImage(named: friend.personalImage)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        row = (indexPath as NSIndexPath).row
        return indexPath
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FriendTableSegue"{
            let dest = (segue.destination as! FriendVC)
            let friendsRepo = FriendRepository.sharedInstance

            dest.name = friendsRepo.friendsArray[row].name
            dest.limit = friendsRepo.friendsArray[row].limitBAC
            dest.percentage = friendsRepo.friendsArray[row].currentBAC
        }
    }
    
    
}
