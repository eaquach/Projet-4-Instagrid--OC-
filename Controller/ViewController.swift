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
    
    
    
    @IBAction func didTapButton(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
       imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }
    
    
    
    
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
//            plusButton[0].setImage(image, for: .normal)
//        }
            
            for button in plusButton {
                if button.tag == 0 {
                    plusButton[0].setImage(image, for: .selected)
                } else if button.tag == 1 {
                    plusButton[1].setImage(image, for: .normal)
                } else if button.tag == 2 {
                    plusButton[2].setImage(image, for: .normal)
            } else if button.tag == 3 {
                plusButton[3].setImage(image, for: .normal)
            }
            }
        
            
        
    picker.dismiss(animated: true)
        }
        
        
        
        
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }
    
    
    
    
    
    
//    private func gestureSetup() {
//           gestureSwipeRecognizer.delegate = self
//
//           let leftSwipe =  UISwipeGestureRecognizer(target: self,
//                                                     action: #selector(self.handleGesture(gesture:)))
//           leftSwipe.direction = .left
//           view.addGestureRecognizer(leftSwipe)
//
//           let upSwipe =  UISwipeGestureRecognizer(target: self,
//                                                   action: #selector(self.handleGesture(gesture:)))
//           upSwipe.direction = .up
//           view.addGestureRecognizer(upSwipe)
//       }
//    let deviceOrientation = UIApplication.shared.statusBarOrientation
//            let swipeDirection: UISwipeGestureRecognizer.Direction = deviceOrientation == .portrait ? .up : .left
//            gridViewAnimateOut(to: swipeDirection)
//
//
//
}


