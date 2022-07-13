//
//  LayoutStyle.swift
//  Projet 4 Instagrid
//
//  Created by Elizabeth Quach on 13/07/2022.
//

import UIKit

class LayoutStyle: UIView {

  @IBOutlet private var label : UILabel!
  @IBOutlet private var icon : UIImageView!
    @IBOutlet private var pictureStackView : [UIButton]!
    
    enum Style {
        case layout1, layout2, layout3
    }
    
    var style:Style = .layout1 {
        didSet {
            setStyle(style)
    }
    }
    
    private func setStyle(_ style: Style) {
        switch style {
            case .layout1:
                
            case .layout2:
                break
            case .layout3:
                break
        }
    }
        
        
        
    var title = "" {
        didSet {
            label.text = title
        }
        
     
    }
}
