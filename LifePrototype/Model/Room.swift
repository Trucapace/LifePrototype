//
//  Room.swift
//  LifePrototype
//
//  Created by David Blanck on 1/3/21.
//

import Foundation
import RealmSwift

class Room: Object {
    @objc dynamic var roomName: String = ""
    let games = List<Game>()
    
    override init() {
        
    }
    
    init(roomNamer: String) {
     
        self.roomName = roomNamer
        
    }
    
}
