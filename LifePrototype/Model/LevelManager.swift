//
//  LevelManager.swift
//  LifePrototype
//
//  Created by David Blanck on 12/31/20.
//

import Foundation

struct LevelManager {
    
    struct Level {
        
        var levelNum: Int = 0
        var numberOfRows: Int = 0
        var numberOfColumns: Int = 0
        var canPlay: Bool = false
        var maxSize: Int = 0
        var maxAge: Int = 0
        
    }

    var levelsArray: [Level] = [
        Level(levelNum: 1, numberOfRows: 4, numberOfColumns: 4, canPlay: true),
        Level(levelNum: 2, numberOfRows: 5, numberOfColumns: 5, canPlay: true),
        Level(levelNum: 3, numberOfRows: 6, numberOfColumns: 6, canPlay: true),
        Level(levelNum: 4, numberOfRows: 7, numberOfColumns: 7, canPlay: true),
        Level(levelNum: 5, numberOfRows: 7, numberOfColumns: 10, canPlay: false),
        Level(levelNum: 6, numberOfRows: 20, numberOfColumns: 20, canPlay: false)
    ]
    
    
    
    
}
