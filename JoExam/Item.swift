//
//  Item.swift
//  JoExam
//
//  Created by user146982 on 3/5/19.
//  Copyright © 2019 user146982. All rights reserved.
//

import Foundation

class Item {
    var name = ""
    var checked = false
    
    func toggle() {
        checked = !checked
    }
}
