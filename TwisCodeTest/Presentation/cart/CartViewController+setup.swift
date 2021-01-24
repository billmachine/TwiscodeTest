//
//  CartViewController+setup.swift
//  TwisCodeTest
//
//  Created by Ahmad Billi Afandi on 24/01/21.
//

import UIKit

extension CartViewController {
    func setupView() {
       //radius
        bottomCardView.clipsToBounds = true
        bottomCardView.layer.cornerRadius = 40
        bottomCardView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner] // Top right corner, Top left
        bottomCardView.layer.masksToBounds = true;
        //shadow
        bottomCardView.backgroundColor = UIColor.white
        bottomCardView.layer.shadowColor = UIColor.lightGray.cgColor
        bottomCardView.layer.shadowOpacity = 0.8
        bottomCardView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        bottomCardView.layer.shadowRadius = 6.0
        bottomCardView.layer.masksToBounds = false
        //padding bottom
        cartTable.contentInset.bottom = 180
    }
}
