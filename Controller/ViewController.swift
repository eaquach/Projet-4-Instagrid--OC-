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
   

    @IBOutlet weak var PictureStackView: UIStackView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBOutlet var plusButton: [UIButton]!
    @IBOutlet var layoutButton: [UIButton]!
   
    
    
  
    
    
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
    
    @IBAction func didTapButton() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
  
            
          
            
            }
     
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("\(info)")
        picker.dismiss(animated: true)
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
    
    
    



}

