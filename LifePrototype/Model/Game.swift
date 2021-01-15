//
//  Game.swift
//  LifePrototype
//
//  Created by David Blanck on 1/3/21.
//

import Foundation
import RealmSwift

class Game: Object {
    
    @objc dynamic var levelNum: Int = 0
    @objc dynamic var numberOfRows: Int = 0
    @objc dynamic var numberOfColumns: Int = 0
    @objc dynamic var targetSize: Int = 0
    @objc dynamic var targetAge: Int = 0
    @objc dynamic var maxSize: Int = 0
    @objc dynamic var maxAge: Int = 0
    @objc dynamic var metTarget: Bool = false
    @objc dynamic var isPlayable: Bool = false
    
    var parentRoom = LinkingObjects(fromType: Room.self, property: "games")
    
    override init() {
        
    }
    
    init(levelNum: Int, numberOfRows: Int, NumberOfColumns: Int, targetSize: Int, targetAge: Int, isPlayable: Bool) {
        
        self.levelNum = levelNum
        self.numberOfRows = numberOfRows
        self.numberOfColumns = NumberOfColumns
        self.targetSize = targetSize
        self.targetAge = targetAge
        self.isPlayable = isPlayable
        
    }
 
    
    
}
