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
    
    static let sharedInstance: FriendRepository = {
        let repo = FriendRepository()
        var dirpath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        dirpath = "file://" + dirpath
        let dirurl = URL(string: dirpath)
        let fileurl = dirurl?.appendingPathComponent("friends.json")
        //let fm = FileManager.default
        print(dirpath)
        
        do {
            let data = try Data(contentsOf: fileurl!)
           repo.friendsArray = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [Friend]
           // print(repo.words.count)
        } catch{
            print("error")
        }
        
        //if fm.fileExists(atPath: (fileurl?.absoluteString)!){
        //   print("is a file")
        //} else {
        //   print("no file")
        //}
        return repo
    }()
    
    func save(){
        //send array back to the file
        var dirpath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        dirpath = "file://" + dirpath
        let dirurl = URL(string: dirpath)
        let fileurl = dirurl?.appendingPathComponent("friends.json")
        do{
            let json = try JSONSerialization.data(withJSONObject: friendsArray, options: .prettyPrinted)
            try json.write(to: fileurl!)
        }catch{
            print("error")
        }
    }
}
