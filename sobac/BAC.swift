//
//  BAC.swift
//  sobac
//
//  Created by Daniel Porter on 11/15/16.
//  Copyright © 2016 Daniel Porter. All rights reserved.
//

import Foundation

class BAC {
    //Widmark's Formula
    //% BAC = (A x 5.14 / W x r) – .015 x H
    var A: Double = 0.0 //Liquid ounces of alcohol consumed
    var W: Double = 0.0 //Person's weight in pounds
    var r = [0.73, 0.66] //A gender constant of alcohol distribution (.73 for men and .66 for women)
    var H: Double = 0.0 //Hours elapsed since drinking commenced
    var gender: Int = 0 //0 for male, 1 for female
    
    var defaults = UserDefaults()
    
    var bloodAlcoholContent = 0.0
    
    var dict = Dictionary<String, AnyObject>()
    
    static let sharedInstance: BAC = {
        let bac = BAC()
        
        if (bac.defaults.object(forKey: "Ounces") != nil) {
            bac.A = bac.defaults.double(forKey: "Ounces")
        } else {
            bac.A = 0.0
            bac.defaults.set(0.0, forKey: "Ounces")
        }
        if (bac.defaults.object(forKey: "Gender") != nil) {
            bac.gender = bac.defaults.integer(forKey: "Gender")
        } else {
            bac.gender = 0
            bac.defaults.set(0, forKey: "Gender")
        }
        if (bac.defaults.object(forKey: "Weight") != nil) {
            bac.W = bac.defaults.double(forKey: "Weight")
        } else {
            bac.W = 140.0
            bac.defaults.set(140.0, forKey: "Weight")
        }
        
        bac.defaults.synchronize()

        return bac
    }()
    
    func calcBAC() {
        var startTime = Date()
        
        if (defaults.object(forKey: "StartTime") != nil) {
            startTime = defaults.value(forKey: "StartTime") as! Date
        } else {
            defaults.set(startTime, forKey: "StartTime")
        }
        
        defaults.synchronize()
        
        let cal = Calendar.current.dateComponents([.hour, .minute], from: startTime, to: Date())
        
        let hourPassed = Double(cal.hour!) + Double(cal.minute!) / 60.0
        
        bloodAlcoholContent = (A * 5.14 / W * r[gender]) - 0.015 * hourPassed
        if(bloodAlcoholContent < 0.0) {
            bloodAlcoholContent = 0.0
        }
        
        print(A)
        print(W)
        print(r[gender])
        print(0.015 * hourPassed)
        print(bloodAlcoholContent)
        print("-------------")
    }
    
    
}
