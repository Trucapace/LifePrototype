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
    @objc dynamic var canPlay: Bool = false
    @objc dynamic var maxSize: Int = 0
    @objc dynamic var maxAge: Int = 0
    var parentRoom = LinkingObjects(fromType: Room.self, property: "games")
    
}
