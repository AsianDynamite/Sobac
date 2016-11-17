//
//  bacKVO.swift
//  sobac
//
//  Created by Daniel Porter on 11/16/16.
//  Copyright © 2016 Daniel Porter. All rights reserved.
//

import Foundation

class bacObserver: NSObject {
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        print("Value changed to \(change![NSKeyValueChangeKey.newKey]!)")
    }
}
