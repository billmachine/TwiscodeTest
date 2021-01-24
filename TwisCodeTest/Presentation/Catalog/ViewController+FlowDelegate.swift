//
//  ViewController+FlowDelegate.swift
//  TwisCodeTest
//
//  Created by Ahmad Billi Afandi on 24/01/21.
//

import UIKit

extension ViewController:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.calculateWith()
        return CGSize(width: width, height: width)
    }

    func calculateWith() -> CGFloat {
//        let estimateWidth = 826.0
//        let estimatedWidth = CGFloat(300);
        
        let estimatedWidth = CGFloat(150)
        let cellMarginSize = 5.0
        
        let cellCount = floor( CGFloat ( self.view.frame.size.width / estimatedWidth ) )
        let lrmargin = CGFloat(cellMarginSize * 2 )
        //fullwidth layar - (margintanpakanankiri) - marginkanankirinya
        let width = (self.view.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1 ) - lrmargin) / cellCount

        return width
    }

}
