//
//  ViewController.swift
//  LifePrototype
//
//  Created by David Blanck on 12/22/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button00: UIButton!
    @IBOutlet weak var button01: UIButton!
    @IBOutlet weak var button02: UIButton!
    @IBOutlet weak var button03: UIButton!
    @IBOutlet weak var button04: UIButton!
    @IBOutlet weak var button05: UIButton!
    @IBOutlet weak var button06: UIButton!
    @IBOutlet weak var button07: UIButton!
    @IBOutlet weak var button08: UIButton!
    @IBOutlet weak var button09: UIButton!
    
    @IBOutlet weak var button10: UIButton!
    @IBOutlet weak var button11: UIButton!
    @IBOutlet weak var button12: UIButton!
    @IBOutlet weak var button13: UIButton!
    @IBOutlet weak var button14: UIButton!
    @IBOutlet weak var button15: UIButton!
    @IBOutlet weak var button16: UIButton!
    @IBOutlet weak var button17: UIButton!
    @IBOutlet weak var button18: UIButton!
    @IBOutlet weak var button19: UIButton!
    
    @IBOutlet weak var button20: UIButton!
    @IBOutlet weak var button21: UIButton!
    @IBOutlet weak var button22: UIButton!
    @IBOutlet weak var button23: UIButton!
    @IBOutlet weak var button24: UIButton!
    @IBOutlet weak var button25: UIButton!
    @IBOutlet weak var button26: UIButton!
    @IBOutlet weak var button27: UIButton!
    @IBOutlet weak var button28: UIButton!
    @IBOutlet weak var button29: UIButton!
    
    @IBOutlet weak var button30: UIButton!
    
    
    
    
    
    
    
    
    
    var lifeManager = LifeManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func gridButtonPressed(_ sender: UIButton) {
        
        print(sender.tag)
        
        let row = sender.tag / 10
        let col = sender.tag % 10
        
        if sender.titleLabel?.text == "O" {
            sender.setTitle("X", for: UIControl.State.normal)
            lifeManager.matrix[row][col] = 1
        } else {
            sender.setTitle("O", for: UIControl.State.normal)
            lifeManager.matrix[row][col] = 0
        }
        
    }
    
    
    @IBAction func goButtonPressed(_ sender: UIButton) {
        
        lifeManager.updateMatrix()
        print(lifeManager.matrix[0])
        print(lifeManager.matrix[1])
        print(lifeManager.matrix[2])
        print(lifeManager.matrix[3])
        print(lifeManager.matrix[4])
        print(lifeManager.matrix[5])
        print(lifeManager.matrix[6])
        print(lifeManager.matrix[7])
        print(lifeManager.matrix[8])
        print(lifeManager.matrix[9])
        print("------------------------------")
        updateDisplay()
    }
    

    func updateDisplay() {
        
        
        
      
    }
    
    
    
}

