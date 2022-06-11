//
//  extension+UIView.swift
//  app
//
//  Created by ahmed abdalla on 25/02/2022.
//

import UIKit
@IBDesignable extension UIView {

    
    @IBInspectable
    public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable
    public var borderColor: UIColor {
        get {
            var color = UIColor.white
            if let border = layer.borderColor {
                color = UIColor(cgColor: border)
            }
            return  color
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable
    public var borderWidth: CGFloat {
        get {
            return  layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    public var shadowRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            clipsToBounds = true
            layer.masksToBounds = false
            layer.shadowRadius = newValue / 50
            layer.shadowColor = UIColor.darkGray.cgColor
            let scale = UIScreen.main.scale
            layer.shadowOffset = CGSize(width: 0, height: 0.5)
            layer.shadowOpacity = 0.8
            layer.needsDisplayOnBoundsChange = true
            layer.contentsScale = scale
            layer.rasterizationScale = scale
            layer.shouldRasterize = true
        }
    }
    
    
    @IBInspectable
    public var cornerRadiusTop: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.masksToBounds = newValue > 0
            layer.cornerRadius = newValue
            layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            
            // border
            layer.borderWidth = borderWidth
            layer.borderColor = borderColor.cgColor
            
            layer.masksToBounds = false
            layer.shadowColor = UIColor.gray.cgColor
            layer.shadowOpacity = 0.5
            layer.shadowOffset = CGSize(width: 0.2, height: 0.2)
            layer.shadowRadius = 1.5
            layer.shouldRasterize = true
            layer.rasterizationScale = UIScreen.main.scale
        }
    }
   
}

