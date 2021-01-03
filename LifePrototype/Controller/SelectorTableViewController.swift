//
//  SelectorTableViewController.swift
//  LifePrototype
//
//  Created by David Blanck on 12/31/20.
//

import UIKit

class SelectorTableViewController: UITableViewController {

    var levelManager = LevelManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
     
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return levelManager.levelsArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LevelCell", for: indexPath)
        
        let row = levelManager.levelsArray[indexPath.row].numberOfRows
        let col = levelManager.levelsArray[indexPath.row].numberOfColumns
        
        cell.textLabel?.text = "Level \(levelManager.levelsArray[indexPath.row].levelNum) - \(col)x\(row) matrix"
        
        if levelManager.levelsArray[indexPath.row].canPlay == true {
            cell.textLabel?.textColor = .black
        } else {
            cell.textLabel?.textColor = .lightGray
        }
        
        
        return cell
    }
    
    
    //MARK: - Table view Delegates
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if levelManager.levelsArray[indexPath.row].canPlay == true {
            performSegue(withIdentifier: "goToGame", sender: self)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! GameViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            
            let row = levelManager.levelsArray[indexPath.row].numberOfRows
            let col = levelManager.levelsArray[indexPath.row].numberOfColumns
            
            destinationVC.lifeManager = LifeManager(rows: row, cols: col)
        }
    }
    
    
    

   
}
