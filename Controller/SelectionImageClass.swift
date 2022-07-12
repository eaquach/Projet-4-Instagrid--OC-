//
//  SelectionImageClass.swift
//  Projet 4 Instagrid
//
//  Created by Elizabeth Quach on 12/07/2022.
//

import UIKit

class SelectionImageClass: UIViewController {

    @IBOutlet var layoutButton: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    
    @IBAction func layoutButtonTapped(_ sender: UIButton) {
        let tag = sender.tag
        for button in layoutButton {
            if button.tag <= tag {
                // selected
                button.setTitle("", for: .normal)
               
                let image = UIImage(named: "Selected")
                button.setImage(image, for: .normal)
            }
            sender.setTitle("Selected", for: .normal)
                // not selected
        
                
            }
        
    

       
    
    
    }
    
    
    
    
    
    
    
    
    
    
    
    
   

}
