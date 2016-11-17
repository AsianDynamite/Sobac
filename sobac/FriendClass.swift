//
//  File.swift
//  sobac
//
//  Created by Andrew Henry on 11/15/16.
//  Copyright © 2016 Daniel Porter. All rights reserved.
//

import Foundation
import UIKit

class Friend{
    var name: String
    var personalImage: String
    var limitBAC: String
    var currentBAC: String
    
    init(name : String, limitBAC: String, currentBAC : String, personalImage : String) {
        self.name = name
        self.personalImage = personalImage
        self.limitBAC = limitBAC
        self.currentBAC = currentBAC
    }
    
    func convertToDict() -> [String:String] {
        let dict = ["name": self.name, "personalImage": self.personalImage, "limitBAC": self.limitBAC, "currentBAC": self.currentBAC]
        
        return dict
    }
    
}
