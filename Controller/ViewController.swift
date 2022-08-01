//
//  ViewController.swift
//  Projet 4 Instagrid
//
// 
//

import Photos
import PhotosUI
import UIKit
import SwiftUI


struct LayoutPosition {
    static let topLeft = 0
    
    static let topRight = 1
    
    static let bottomLeft = 2
    
    static let bottomRight = 3
    
}



class ViewController: UIViewController {
    
    //Properties used for the methods
    private var tappedImageButtonTag = Int()
    private let imagePicker = UIImagePickerController()
    
    //IBOutlets
    @IBOutlet weak var PictureStackView: UIStackView!
    @IBOutlet var plusButton: [UIButton]!
    @IBOutlet var layoutButton: [UIButton]!
    
    @IBOutlet weak var SwipeArrow: UIImageView!
    
    @IBAction func SwipeActionShare(_ sender: UISwipeGestureRecognizer) {

    }
    var swipe : UISwipeGestureRecognizer!
    
    func swipeShare (_ sender: UISwipeGestureRecognizer) {
        switch sender.state {
            case .began, .changed:
            animateSwipeView(gesture: sender)
            
            default:
                break
    }
   
        
    }
    
    private func animateSwipeView(gesture: UISwipeGestureRecognizer) {
        let translation = gesture.view?.transform
    }
    
    private func picturesShared(){
    
}

    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutButton[2].setImage(UIImage(named: "Selected"), for: .normal)
        SwipeArrow.isUserInteractionEnabled = true
        
        swipe = UISwipeGestureRecognizer(target:self, action: #selector(self.swipeGesture(sendr:)))
        swipe.direction = UISwipeGestureRecognizer.Direction.up
        SwipeArrow.addGestureRecognizer(swipe)
        
        
      
    }
    
    @objc func swipeGesture(sendr: UISwipeGestureRecognizer?) {
      // generate UImage from pciture stack view
        // invoke sharing menu with UImage in parameter
    }
    
    
    private func presentImagePicker() {
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }
    
    
    
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
                plusButton[LayoutPosition.topRight].isHidden = true
                plusButton[LayoutPosition.bottomRight].isHidden = false
            case 1 :
                plusButton[LayoutPosition.topRight].isHidden = false
                plusButton[LayoutPosition.bottomRight].isHidden = true
            case 2 :
                plusButton[LayoutPosition.topRight].isHidden = false
                plusButton[LayoutPosition.bottomRight].isHidden = false
            default:
                break
        }
    }
    
    @IBAction func didTapButton(_ sender: UIButton) {
        tappedImageButtonTag = sender.tag
        presentImagePicker()
    }
    
    
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            plusButton[tappedImageButtonTag].setImage(image, for: .normal)
            
            
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
   
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            swipe.direction = .left
        
        } else { swipe.direction = .up
    }
    
    
    }
    
    
}






//    let deviceOrientation = UIApplication.shared.statusBarOrientation
//            let swipeDirection: UISwipeGestureRecognizer.Direction = deviceOrientation == .portrait ? .up : .left
//            gridViewAnimateOut(to: swipeDirection)
//
//
//
//}
