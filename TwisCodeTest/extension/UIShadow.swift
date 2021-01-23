//
//  UIShadow.swift
//  TwisCodeTest
//
//  Created by Ahmad Billi Afandi on 24/01/21.
//

import UIKit

//extension UIView {
//
//    func installShadow() {
//            layer.cornerRadius = 2
//            layer.masksToBounds = false
//            layer.shadowColor = UIColor.black.cgColor
//            layer.shadowOffset = CGSize(width: 0, height: 1)
//            layer.shadowOpacity = 0.45
//            layer.shadowPath = UIBezierPath(rect: bounds).cgPath
//            layer.shadowRadius = 1.0
//        }
//
//}

extension UIView {

    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            layer.mask = mask
        }
    
    


}
