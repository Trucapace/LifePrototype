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
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        
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
        
        
        let row = rooms?[indexPath.section].games[indexPath.row].numberOfRows ?? 0
        let col = rooms?[indexPath.section].games[indexPath.row].numberOfColumns ?? 0
        let level = rooms?[indexPath.section].games[indexPath.row].levelNum ?? 0
        let age = rooms?[indexPath.section].games[indexPath.row].maxAge ?? 0
        let size = rooms?[indexPath.section].games[indexPath.row].maxSize ?? 0
        
        cell.textLabel?.text = "Level \(level) - \(col)x\(row) matrix - Age:  \(age) Size: \(size)"
        
        if indexPath.row == 0 {
            cell.textLabel?.textColor = .black
        } else if rooms?[indexPath.section].games[indexPath.row - 1].metTarget == true {
            cell.textLabel?.textColor = .black
        } else {
            cell.textLabel?.textColor = .lightGray
        }

        return cell
    }
    
    
    //MARK: - Table view Delegates
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            selectedGame = rooms?[indexPath.section].games[indexPath.row]
            performSegue(withIdentifier: "goToGame", sender: self)
        } else if rooms?[indexPath.section].games[indexPath.row - 1].metTarget == true {
            selectedGame = rooms?[indexPath.section].games[indexPath.row]
            performSegue(withIdentifier: "goToGame", sender: self)
        } else {
  
        }
        
        tableView.deselectRow(at: indexPath, animated: true)

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! GameViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            
            let row = rooms![indexPath.section].games[indexPath.row].numberOfRows
            let col = rooms![indexPath.section].games[indexPath.row].numberOfColumns
            
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
  
        let begRoom = Room(roomName: "Beginner")
        let intRoom = Room(roomName: "Intermediate")
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
                    game.metTarget = gameData.beginnerGames[index].metTarget
                    begRoom.games.append(game)
                }
            } catch {
                print("Error writing to realm \(error)")
            }
            
        }
        
        for (index, game) in gameData.intermediateGames.enumerated() {
            
            do {
                try realm.write {
                    game.levelNum = gameData.intermediateGames[index].levelNum
                    game.numberOfRows = gameData.intermediateGames[index].numberOfRows
                    game.numberOfColumns = gameData.intermediateGames[index].numberOfColumns
                    game.targetSize = gameData.intermediateGames[index].targetSize
                    game.targetAge = gameData.intermediateGames[index].targetAge
                    game.metTarget = gameData.intermediateGames[index].metTarget
                    intRoom.games.append(game)
                }
            } catch {
                print("Error writing to realm \(error)")
            }
            
        }
        
        
    }
    

}
