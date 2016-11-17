//
//  FriendRepository.swift
//  sobac
//
//  Created by Andrew Henry on 11/15/16.
//  Copyright © 2016 Daniel Porter. All rights reserved.
//

import Foundation

class FriendRepository {
    var friendsArray = [Friend]()
    
    //creates singleton respository, loads friend data from local memory to the firends array with each call
    static let sharedInstance: FriendRepository = {
        let repo = FriendRepository()
        repo.friendsArray.removeAll()
        
        var dirpath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        dirpath = "file://" + dirpath
        let dirurl = URL(string: dirpath)
        let fileurl = dirurl?.appendingPathComponent("friends.json")
        
        var jsonObj: Any?
        do {
            let data = try Data(contentsOf: fileurl!)
            jsonObj = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            //creates friend objects from dictionary
            for dict in (jsonObj as! [NSDictionary]) {
                let name = dict["name"] as! String
                let personalImage = dict["personalImage"] as! String
                let limitBAC = dict["limitBAC"] as! String
                let currentBAC = dict["currentBAC"] as! String
                
                let friend = Friend(name: name, limitBAC: limitBAC, currentBAC: currentBAC, personalImage: personalImage )
                repo.friendsArray.append(friend)
            }
            
        } catch{
            print("error")
        }
        
        return repo
    }()
    
    //saves friends to local memory
    func save(){
        //send array back to the file
        var dirpath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        dirpath = "file://" + dirpath
        let dirurl = URL(string: dirpath)
        let fileurl = dirurl?.appendingPathComponent("friends.json")
        
        var data = [Dictionary<String, String>]()
        
        //creates array of dictionaries
        for friend in friendsArray{
            data.append(friend.convertToDict())
        }
        //writes to json file named "friends.json"
        do{
            let json = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
            try json.write(to: fileurl!)
        }catch{
            print("error")
        }
    }
    
    //checks if a friend has already been added. Ignores if already added, adds if not already added
    func addFriend(newFriend: Friend){
        for friend in friendsArray{
            if(newFriend.name == friend.name){
                return
            }
        }
        friendsArray.append(newFriend)
    }
}

