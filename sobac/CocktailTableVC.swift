//
//  CocktailTableVC.swift
//  sobac
//
//  Created by Nate Henry on 11/13/16.
//  Copyright © 2016 Nate Henry. All rights reserved.
//

import UIKit

class CocktailTableVC: UITableViewController, URLSessionDelegate, URLSessionDownloadDelegate {
    
    var nameSearch : Bool!
    var ingredientSearch : Bool!
    var searchString : String!
    
    var drinkArrayObjs = [drinks]()
    var drinkImages = [UIImage]()
    var row : Int = 0
    var jsonPath : String!
    
    @IBAction func backToSearch(_ segue: UIStoryboardSegue!) {
        
    }
    
    func urlSession(_ session : URLSession, downloadTask : URLSessionDownloadTask, didFinishDownloadingTo location : URL){
        do{
            let data = try Data(contentsOf: location)
            
            OperationQueue.main.addOperation{
                self.done(drinkData: data)
            }
        } catch {
            print("error")
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didResumeAtOffset fileOffset: Int64, expectedTotalBytes: Int64) {
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
    }
    
    func done(drinkData: Data) {
        do{
            let obj = try JSONSerialization.jsonObject(with: drinkData, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, AnyObject>
            
            let drinkArray = obj["drinks"]! as! [AnyObject]
            let fields = ["strDrink", "strDrinkThumb", "idDrink"]
            let queue = OperationQueue()
            var count = 0;
            
            for drink in drinkArray {
                let newDrink = drinks()
                let dictLoan = drink as! Dictionary<String, AnyObject>
                
                for (lkey, lvalue) in dictLoan{
                    if(fields.contains(lkey)){
                        if(lvalue is NSString){
                            newDrink.setValue(lvalue, forKey: lkey)
                        }
                        else{
                            newDrink.setValue("http://listsurge.com/wp-content/uploads/2016/02/drinks.jpg", forKey: lkey)
                        }
                    }
                }
                
                drinkArrayObjs.append(newDrink)
                let myOp = TestOperation(myURL: newDrink.strDrinkThumb)
                myOp.index = count;
                count += 1;
                drinkImages.append(UIImage())
                    
                myOp.completionBlock = {
                    OperationQueue.main.addOperation ({
                        self.drinkImages[myOp.index] = myOp.myImage
                        self.tableView.reloadData()
                    })
                }
                    
                queue.addOperation(myOp)
            }
            self.tableView.reloadData()
        } catch{
            print("Error Loading in packs")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        if(nameSearch!){
            jsonPath = "http://www.thecocktaildb.com/api/json/v1/1/search.php?s=" + searchString!
        } else if(ingredientSearch!){
            jsonPath = "http://www.thecocktaildb.com/api/json/v1/1/filter.php?i=" + searchString!
        }
        
        var newJSONPath = ""
        for c in jsonPath.characters {
            
            if(c == " "){
                newJSONPath += "%20"
            } else {
                newJSONPath += String(c)
            }
        }
        
        jsonPath = newJSONPath
        
        let url = URL(string: jsonPath)
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config, delegate: self, delegateQueue: nil)
        
        let dtask = session.downloadTask(with: url!)
        dtask.resume()
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
        return drinkArrayObjs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cocktail", for: indexPath) as! CocktailCell

        // Configure the cell...
        
        cell.drinkNameLabel?.text = drinkArrayObjs[indexPath.row].strDrink
        cell.drinkImageView?.image = drinkImages[indexPath.row]

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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if(segue.identifier == "drinkPageSegue"){
            let child = (segue.destination as! DrinkDetailsViewController)
            child.drinkID = drinkArrayObjs[row].idDrink
        }
    }
 

}
