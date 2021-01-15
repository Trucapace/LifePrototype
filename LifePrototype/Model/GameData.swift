//
//  GameData.swift
//  LifePrototype
//
//  Created by David Blanck on 1/11/21.
//

import Foundation

struct GameData {
    
    let beginnerGames = [
        Game(levelNum: 1, numberOfRows: 5, NumberOfColumns: 5, targetSize: 0, targetAge: 0, isPlayable: true),
        Game(levelNum: 2, numberOfRows: 6, NumberOfColumns: 6, targetSize: 0, targetAge: 0, isPlayable: true),
        Game(levelNum: 3, numberOfRows: 7, NumberOfColumns: 7, targetSize: 0, targetAge: 0, isPlayable: true),
        Game(levelNum: 4, numberOfRows: 10, NumberOfColumns: 10, targetSize: 0, targetAge: 0, isPlayable: true),
        Game(levelNum: 5, numberOfRows: 15, NumberOfColumns: 15, targetSize: 10, targetAge: 0, isPlayable: true)
        
    ]
    
    let intermediateGames = [
        Game(levelNum: 10, numberOfRows: 10, NumberOfColumns: 10, targetSize: 0, targetAge: 0, isPlayable: true),
        Game(levelNum: 11, numberOfRows: 12, NumberOfColumns: 12, targetSize: 15, targetAge: 0, isPlayable: false),
        Game(levelNum: 12, numberOfRows: 12, NumberOfColumns: 12, targetSize: 0, targetAge: 15, isPlayable: false)
    
    ]
    
    
    
    
    
    
    
}
