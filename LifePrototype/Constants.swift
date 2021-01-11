//
//  Constants.swift
//  LifePrototype
//
//  Created by David Blanck on 12/29/20.
//

import UIKit

struct K {
    static let gridSpacing: CGFloat = 2.0
    
    static let levelsData: [[String : Any]] = [
    //  [room, rows, cols, initially playable, age target, size target]
        ["room" : "Beginner", "rows" : 4, "columns" : 4,"playable" : true, "age" : 0, "size" : 0],
        ["room" : "Beginner", "rows" : 5, "columns" : 5,"playable" : true, "age" : 0, "size" : 0],
        ["room" : "Beginner", "rows" : 6, "columns" : 6,"playable" : true, "age" : 0, "size" : 0],
        ["room" : "Intermediate", "rows" : 7, "columns" : 7,"playable" : true, "age" : 0, "size" : 10],
        ["room" : "Intermediate", "rows" : 6, "columns" : 10,"playable" : false, "age" : 0, "size" : 15],
        ["room" : "Intermediate", "rows" : 20, "columns" : 20,"playable" : false, "age" : 15, "size" : 0],
        ["room" : "Intermediate", "rows" : 20, "columns" : 20,"playable" : false, "age" : 20, "size" : 0]
        
        
        
    ]
    
    
}

