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
    @IBOutlet weak var button89: UIButton!
    
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
    
    var buttonMatrix = [[UIButton]](repeating: [UIButton](repeating: UIButton(), count: 10), count: 10)
    
    
    var lifeManager = LifeManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillButtonMatrix()
        
  
        
    }

    @IBAction func gridButtonPressed(_ sender: UIButton) {
        
        print(sender.tag)
        
        let row = sender.tag / 10
        let col = sender.tag % 10
        
        if sender.titleLabel?.text == "O" {
//            sender.setTitle("X", for: .normal)
            sender.backgroundColor = .cyan
            lifeManager.matrix[row][col] = 1
        } else {
//            sender.setTitle("O", for: .normal)
            sender.backgroundColor = .white
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
        
        for row in 0...9 {
            for col in 0...9 {
                
                if lifeManager.matrix[row][col] == 1 {
//                    buttonMatrix[row][col].setTitle("X", for: .normal)
                    buttonMatrix[row][col].backgroundColor = .cyan
                } else {
//                    buttonMatrix[row][col].setTitle("O", for: .normal)
                    buttonMatrix[row][col].backgroundColor = .white
                }
            }
        }
        
        
        
        
        
      
    }
    
    func fillButtonMatrix() {
        
        buttonMatrix[0][0] = button00
        buttonMatrix[0][1] = button01
        buttonMatrix[0][2] = button02
        buttonMatrix[0][3] = button03
        buttonMatrix[0][4] = button04
        buttonMatrix[0][5] = button05
        buttonMatrix[0][6] = button06
        buttonMatrix[0][7] = button07
        buttonMatrix[0][8] = button08
        buttonMatrix[0][9] = button09
        
        buttonMatrix[1][0] = button10
        buttonMatrix[1][1] = button11
        buttonMatrix[1][2] = button12
        buttonMatrix[1][3] = button13
        buttonMatrix[1][4] = button14
        buttonMatrix[1][5] = button15
        buttonMatrix[1][6] = button16
        buttonMatrix[1][7] = button17
        buttonMatrix[1][8] = button18
        buttonMatrix[1][9] = button19
        
        buttonMatrix[2][0] = button20
        buttonMatrix[2][1] = button21
        buttonMatrix[2][2] = button22
        buttonMatrix[2][3] = button23
        buttonMatrix[2][4] = button24
        buttonMatrix[2][5] = button25
        buttonMatrix[2][6] = button26
        buttonMatrix[2][7] = button27
        buttonMatrix[2][8] = button28
        buttonMatrix[2][9] = button29
        
        buttonMatrix[3][0] = button30
        buttonMatrix[3][1] = button31
        buttonMatrix[3][2] = button32
        buttonMatrix[3][3] = button33
        buttonMatrix[3][4] = button34
        buttonMatrix[3][5] = button35
        buttonMatrix[3][6] = button36
        buttonMatrix[3][7] = button37
        buttonMatrix[3][8] = button38
        buttonMatrix[3][9] = button39
        
        buttonMatrix[4][0] = button40
        buttonMatrix[4][1] = button41
        buttonMatrix[4][2] = button42
        buttonMatrix[4][3] = button43
        buttonMatrix[4][4] = button44
        buttonMatrix[4][5] = button45
        buttonMatrix[4][6] = button46
        buttonMatrix[4][7] = button47
        buttonMatrix[4][8] = button48
        buttonMatrix[4][9] = button49
        
        buttonMatrix[5][0] = button50
        buttonMatrix[5][1] = button51
        buttonMatrix[5][2] = button52
        buttonMatrix[5][3] = button53
        buttonMatrix[5][4] = button54
        buttonMatrix[5][5] = button55
        buttonMatrix[5][6] = button56
        buttonMatrix[5][7] = button57
        buttonMatrix[5][8] = button58
        buttonMatrix[5][9] = button59
        
        buttonMatrix[6][0] = button60
        buttonMatrix[6][1] = button61
        buttonMatrix[6][2] = button62
        buttonMatrix[6][3] = button63
        buttonMatrix[6][4] = button64
        buttonMatrix[6][5] = button65
        buttonMatrix[6][6] = button66
        buttonMatrix[6][7] = button67
        buttonMatrix[6][8] = button68
        buttonMatrix[6][9] = button69
        
        buttonMatrix[7][0] = button70
        buttonMatrix[7][1] = button71
        buttonMatrix[7][2] = button72
        buttonMatrix[7][3] = button73
        buttonMatrix[7][4] = button74
        buttonMatrix[7][5] = button75
        buttonMatrix[7][6] = button76
        buttonMatrix[7][7] = button77
        buttonMatrix[7][8] = button78
        buttonMatrix[7][9] = button79
        
        buttonMatrix[8][0] = button80
        buttonMatrix[8][1] = button81
        buttonMatrix[8][2] = button82
        buttonMatrix[8][3] = button83
        buttonMatrix[8][4] = button84
        buttonMatrix[8][5] = button85
        buttonMatrix[8][6] = button86
        buttonMatrix[8][7] = button87
        buttonMatrix[8][8] = button88
        buttonMatrix[8][9] = button89
        
        buttonMatrix[9][0] = button90
        buttonMatrix[9][1] = button91
        buttonMatrix[9][2] = button92
        buttonMatrix[9][3] = button93
        buttonMatrix[9][4] = button94
        buttonMatrix[9][5] = button95
        buttonMatrix[9][6] = button96
        buttonMatrix[9][7] = button97
        buttonMatrix[9][8] = button98
        buttonMatrix[9][9] = button99
    }
    
    
    
}

