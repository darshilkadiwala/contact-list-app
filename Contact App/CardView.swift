//
//  CardView.swift
//  Contact App
//
//  Created by bmiit on 3/31/22.
//

import UIKit
import Foundation

@IBDesignable class CardView : UIView{
    @IBInspectable var cornerRadius : CGFloat = 15
    var ofsetWidth : CGFloat = 5
    var ofsetHeight : CGFloat = 5
    var ofsetShadowOpacity : Float = 5
    
    @IBInspectable var ShadowColor:UIColor = UIColor.systemGray4
    override func layoutSubviews() {
        layer.cornerRadius = self.cornerRadius
        layer.shadowOpacity = self.ofsetShadowOpacity
        layer.shadowColor = self.ShadowColor.cgColor
        layer.shadowOffset = CGSize(width: self.ofsetWidth, height: self.ofsetHeight)
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.cornerRadius).cgPath
    }
}
