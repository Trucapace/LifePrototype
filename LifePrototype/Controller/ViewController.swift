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
    @IBOutlet weak var button31: UIButton!
    @IBOutlet weak var button32: UIButton!
    @IBOutlet weak var button33: UIButton!
    @IBOutlet weak var button34: UIButton!
    @IBOutlet weak var button35: UIButton!
    @IBOutlet weak var button36: UIButton!
    @IBOutlet weak var button37: UIButton!
    @IBOutlet weak var button38: UIButton!
    @IBOutlet weak var button39: UIButton!
    
    @IBOutlet weak var button40: UIButton!
    @IBOutlet weak var button41: UIButton!
    @IBOutlet weak var button42: UIButton!
    @IBOutlet weak var button43: UIButton!
    @IBOutlet weak var button44: UIButton!
    @IBOutlet weak var button45: UIButton!
    @IBOutlet weak var button46: UIButton!
    @IBOutlet weak var button47: UIButton!
    @IBOutlet weak var button48: UIButton!
    @IBOutlet weak var button49: UIButton!
    
    @IBOutlet weak var button50: UIButton!
    @IBOutlet weak var button51: UIButton!
    @IBOutlet weak var button52: UIButton!
    @IBOutlet weak var button53: UIButton!
    @IBOutlet weak var button54: UIButton!
    @IBOutlet weak var button55: UIButton!
    @IBOutlet weak var button56: UIButton!
    @IBOutlet weak var button57: UIButton!
    @IBOutlet weak var button58: UIButton!
    @IBOutlet weak var button59: UIButton!
    
    @IBOutlet weak var button60: UIButton!
    @IBOutlet weak var button61: UIButton!
    @IBOutlet weak var button62: UIButton!
    @IBOutlet weak var button63: UIButton!
    @IBOutlet weak var button64: UIButton!
    @IBOutlet weak var button65: UIButton!
    @IBOutlet weak var button66: UIButton!
    @IBOutlet weak var button67: UIButton!
    @IBOutlet weak var button68: UIButton!
    @IBOutlet weak var button69: UIButton!
    
    @IBOutlet weak var button70: UIButton!
    @IBOutlet weak var button71: UIButton!
    @IBOutlet weak var button72: UIButton!
    @IBOutlet weak var button73: UIButton!
    @IBOutlet weak var button74: UIButton!
    @IBOutlet weak var button75: UIButton!
    @IBOutlet weak var button76: UIButton!
    @IBOutlet weak var button77: UIButton!
    @IBOutlet weak var button78: UIButton!
    @IBOutlet weak var button79: UIButton!
    
    @IBOutlet weak var button80: UIButton!
    @IBOutlet weak var button81: UIButton!
    @IBOutlet weak var button82: UIButton!
    @IBOutlet weak var button83: UIButton!
    @IBOutlet weak var button84: UIButton!
    @IBOutlet weak var button85: UIButton!
    @IBOutlet weak var button86: UIButton!
    @IBOutlet weak var button87: UIButton!
    @IBOutlet weak var button88: UIButton!
    @IBOutlet weak var buttion89: UIButton!
    
    @IBOutlet weak var button90: UIButton!
    @IBOutlet weak var button91: UIButton!
    @IBOutlet weak var button92: UIButton!
    @IBOutlet weak var button93: UIButton!
    @IBOutlet weak var button94: UIButton!
    @IBOutlet weak var button95: UIButton!
    @IBOutlet weak var button96: UIButton!
    @IBOutlet weak var button97: UIButton!
    @IBOutlet weak var button98: UIButton!
    @IBOutlet weak var button99: UIButton!
    
    
    
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

