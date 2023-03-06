//
//  HW1_button.swift
//  HW_11
//
//  Created by Olga Novikova on 06.12.2020.
//

import UIKit

// ЗАДАНИЕ 1:
//кнопку, у которой можно изменять ширину и цвет обводки, размер закругления;

@IBDesignable class HW1_button : UIButton {
    // ширина обводки
    @IBInspectable var borderWidth: CGFloat {
        set { layer.borderWidth = newValue }
        get { return layer.borderWidth }
    }
    // цвет обводки
    @IBInspectable var borderColor: UIColor? {
        set { layer.borderColor = newValue?.cgColor }
        get { return layer.borderColor?.UIColorGet }
        }
    
    // размер закругления
    @IBInspectable var cornerRadius: CGFloat {
        set { layer.cornerRadius = newValue }
        get { return layer.cornerRadius  }
    }
}

extension CGColor {
    var UIColorGet: UIKit.UIColor {
        return UIKit.UIColor(cgColor: self)
    }
}
