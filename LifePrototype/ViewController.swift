//
//  ViewController.swift
//  LifePrototype
//
//  Created by David Blanck on 12/22/20.
//

import UIKit

class ViewController: UIViewController {

    var gridValues = Array(repeating: false, count: 100)
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
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
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func gridButtonPressed(_ sender: UIButton) {
        
        print(sender.tag)
        
        if sender.titleLabel?.text == "O" {
            sender.setTitle("X", for: UIControl.State.normal)
            gridValues[sender.tag - 1] = true
        } else {
            sender.setTitle("O", for: UIControl.State.normal)
            gridValues[sender.tag - 1] = false
        }
        
        
    
    }
    
    
    @IBAction func goButtonPressed(_ sender: UIButton) {
        
        print(gridValues)
        
    }
    
    
    func updateDisplay() {
        
      
        
        
    }
    
    
    
}

