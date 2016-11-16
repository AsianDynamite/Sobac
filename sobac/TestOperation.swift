//
//  TestOperation.swift
//  sobac
//
//  Created by Nate Henry on 11/15/16.
//  Copyright © 2016 Daniel Porter. All rights reserved.
//

import UIKit

class TestOperation: Operation {
    var urlString : String!
    var myImage : UIImage!
    var index : Int!
    
    init(myURL : String){
        urlString = myURL
    }
    
    override func main() {
        let url = URL(string: urlString)
        do{
            let data = try Data(contentsOf: url!)
            myImage = UIImage(data: data)
        } catch {
            print("error getting image")
        }
        
    }
}
