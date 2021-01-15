//
//  SelectorTableViewController.swift
//  LifePrototype
//
//  Created by David Blanck on 12/31/20.
//

import UIKit
import RealmSwift

class RoomTableViewController: UITableViewController {
    
    let realm = try! Realm()
    let gameData = GameData()
    
    var rooms: Results<Room>?
    var games: Results<Game>?
    var selectedGame: Game?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadRooms()
        
        if rooms?.count == 0  {
            fillRoom()
            print("fillRoom")
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return rooms?.count ?? 0
        
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return rooms?[section].roomName
        
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return rooms?[section].games.count ?? 0
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "LevelCell", for: indexPath)
        
        let row = games?[indexPath.row].numberOfRows ?? 0
        let col = games?[indexPath.row].numberOfColumns ?? 0
        let level = games?[indexPath.row].levelNum ?? 0
        
        cell.textLabel?.text = "Level \(level) - \(col)x\(row) matrix"
        
        if games?[indexPath.row].metTarget == true {
            cell.textLabel?.textColor = .black
        } else {
            cell.textLabel?.textColor = .lightGray
        }

        return cell
    }
    
    
    //MARK: - Table view Delegates
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if games?[indexPath.row].metTarget == true {
            selectedGame = games?[indexPath.row]
            performSegue(withIdentifier: "goToGame", sender: self)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! GameViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            
            let row = games![indexPath.row].numberOfRows
            let col = games![indexPath.row].numberOfColumns
            
            destinationVC.lifeManager = LifeManager(rows: row, cols: col)
            destinationVC.currentGame = selectedGame
        }
        
    }
    
    
//MARK: - Data Manipulation Methods
    
    func loadRooms() {
        
        rooms = realm.objects(Room.self)
        games = realm.objects(Game.self)
        
        tableView.reloadData()
        
    }
    
    func fillRoom() {
  
        let begRoom = Room(roomNamer: "Beginner")
        let intRoom = Room(roomNamer: "Intermediate")
        begRoom.roomName = "Beginner"
        intRoom.roomName = "Intermediate"
        
                
        do {
            try realm.write {
                realm.add(begRoom)
                realm.add(intRoom)
                print("added new rooms")
            }
        } catch {
            print("Error adding new room \(error)")
        }
        
        for (index, game) in gameData.beginnerGames.enumerated() {
            
            do {
                try realm.write {
                    game.levelNum = gameData.beginnerGames[index].levelNum
                    game.numberOfRows = gameData.beginnerGames[index].numberOfRows
                    game.numberOfColumns = gameData.beginnerGames[index].numberOfColumns
                    game.targetSize = gameData.beginnerGames[index].targetSize
                    game.targetAge = gameData.beginnerGames[index].targetAge
                    begRoom.games.append(game)
                }
            } catch {
                print("Error writing to realm \(error)")
            }
            
        }
        
        
        
//        let newRoom = Room()
//        let newRoom2 = Room()
//        newRoom.roomName = "Beginner"
//        newRoom2.roomName = "Intermediate"
//
//        do {
//            try realm.write {
//                realm.add(newRoom)
//                realm.add(newRoom2)
//                print("added new rooms")
//            }
//        } catch {
//            print("Error adding new room \(error)")
//        }
//
//
//
//        do {
//            try realm.write {
//                let newGame1 = Game()
//                newGame1.levelNum = 1
//                newGame1.numberOfRows = 10
//                newGame1.numberOfColumns = 10
//                newRoom.games.append(newGame1)
//            }
//        } catch {
//            print("Error writing to realm \(error)")
//        }
    
        
        
    }
    

}
