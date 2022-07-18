//
//  ViewController.swift
//  Projet 4 Instagrid
//
// 
//

import Photos
import PhotosUI
import UIKit


class ViewController: UIViewController {
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBOutlet var plusButton: [UIButton]!
    @IBOutlet var layoutButton: [UIButton]!
    @IBOutlet var imageView : UIImageView!
   
    
  
    
    
    @IBAction func layoutButtonTapped(_ sender: UIButton) {
        let tag = sender.tag
                for button in layoutButton {
                    if button.tag == tag {
                        // selected
                        button.setTitle("", for: .normal)
        
                        let image = UIImage(named: "Selected")
                        button.setImage(image, for: .normal)
                    } else {
                        let image = UIImage()
                        button.setImage(image, for: .normal)
                    }
        
                    }
    
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
     
    
    
    
    





