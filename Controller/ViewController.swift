//
//  ViewController.swift
//  Projet 4 Instagrid
//
// 
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBOutlet var plusButton: [UIButton]!
    @IBOutlet var layoutButton: [UIButton]!
    

     
    
    @IBAction func layoutButtonTapped(_ sender: UIButton) {
        layoutButton.forEach { $0.isSelected = true }
        sender.isSelected = true
        switch sender.tag {
        case 0 :
            plusButton[0].isHidden = true
            plusButton[3].isHidden = false
        case 1 :
            plusButton[0].isHidden = false
            plusButton[3].isHidden = true
            
            
        case 2 :
            plusButton[0].isHidden = false
            plusButton[3].isHidden = false
        default:
            break
            
        }
        
        
    
}
}
