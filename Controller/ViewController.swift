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



class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    //Properties used for the methods
    private var tappedImageButtonTag = Int()
    private let imagePicker = UIImagePickerController()
    
    private var windowInterfaceOrientation: UIInterfaceOrientation? {
        if #available(iOS 15.0, *) {
            return UIApplication.shared.windows.first?.windowScene?.interfaceOrientation
        } else {
            return UIApplication.shared.statusBarOrientation
        }
    }
    
    //IBOutlets
    @IBOutlet weak var swipeUpStackView: UIStackView!
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
    
    
    func picturesShared(image : UIImage){
        let share = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        self.present(share, animated: true, completion: nil)
        // opposite animation when share menu
        share.completionWithItemsHandler = {  activity, success, items, error in
            UIView.animate(withDuration: 0.5, animations: {
                self.PictureStackView.transform = .identity
                self.PictureStackView.alpha = 1
            }, completion: nil)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutButton[2].setImage(UIImage(named: "Selected"), for: .normal)
        swipeUpStackView.isUserInteractionEnabled = true
        
        swipe = UISwipeGestureRecognizer(target:self, action: #selector(self.swipeGesture(sender:)))
        swipe.direction = UISwipeGestureRecognizer.Direction.up
        swipeUpStackView.addGestureRecognizer(swipe)
        
        
    }
    
    @objc func swipeGesture(sender: UISwipeGestureRecognizer?) {
        guard let portrait = windowInterfaceOrientation?.isPortrait else {return}
        if portrait {
            UIView.animate(withDuration: 1) {
                
                self.swipeUpStackView.transform = CGAffineTransform(translationX: 0, y: -200)
                self.swipeUpStackView.alpha = 0
            }
        } else {
            UIView.animate(withDuration: 1){
                self.swipeUpStackView.transform = CGAffineTransform(translationX: -200, y: 0)
                self.swipeUpStackView.alpha = 0
            }
        }
    }
    
    
    //        let translationTransform = CGAffineTransform(translationX: 0, y: -300)
    //        // translation à mettre pour le portrait
    //        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn) {
    //            self.swipeUpStackView.transform = translationTransform
    //        } completion: { success in
    //            if success {
    //                self.shareView()
    //            }
    //        }
    //
    //
    //    }
    
//    @objc func shareImage() {
//        let vc = UIActivityViewController(activityItems: [swipeUpStackView.image!], applicationActivities: [])
//        present(vc, animated: true)
//    }
//
    
    private func shareView() {
        let translationTransform = CGAffineTransform(translationX: 0, y: 0)
        UIView.animate(withDuration: 0.3, delay: 1, options: .curveEaseIn) { // check
            self.swipeUpStackView.transform = translationTransform
        } completion: { success in
            if success {
                self.shareView()
            }
        }
    }
    
    private func sharePictureSheet() {
        guard let image = UIImage(systemName: ""), let url = URL(string: "https://www.instagram.com") else
        { return }
        let shareSheetVC = UIActivityViewController(
            activityItems:[
            image,
            url
            ],
            applicationActivities: nil
        )
        present(shareSheetVC, animated: true)
    }
    

    // generate UImage from pciture stack view
    // invoke sharing menu with UImage in parameter
    
    
    
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
    
    func animateSwipeAndShare() {
        
        //        let animation = CABasicAnimation(keyPath: "position")
        //        animation.fromValue =
    }
    //
    
    
}



extension UIView {
    
    func asImage() -> UIImage {
        if #available(iOS 15.0, *) {
            let renderer = UIGraphicsImageRenderer(bounds: bounds)
            return renderer.image { rendererContext in
                layer.render(in: rendererContext.cgContext)
            }
        } else {
            UIGraphicsBeginImageContext(self.frame.size)
            self.layer.render(in:UIGraphicsGetCurrentContext()!)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return UIImage(cgImage: image!.cgImage!)
        }
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







