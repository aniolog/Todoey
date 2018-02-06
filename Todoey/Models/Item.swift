//
//  Item.swift
//  Todoey
//
//  Created by Carlos Lozano on 2/6/18.
//  Copyright © 2018 Carlos Lozano. All rights reserved.
//

import Foundation

class Item{
    
    var title: String
    var done: Bool
    
    
    init() {
        title = ""
        done = false
    }
    
    convenience init(title _title: String , done _done: Bool) {
        self.init()
        title = _title
        done = _done
    }
    
    
    
    
}
