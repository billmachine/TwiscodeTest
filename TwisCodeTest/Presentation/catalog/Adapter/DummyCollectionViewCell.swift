//
//  DummyCollectionViewCell.swift
//  TwisCodeTest
//
//  Created by Ahmad Billi Afandi on 24/01/21.
//

import UIKit
import SkeletonView

class DummyCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var txtDummy1: UILabel!
    @IBOutlet weak var txtDummy2: UILabel!
    @IBOutlet weak var txtDummy3: UILabel!
    static let identifier = String(describing: DummyCollectionViewCell.self)

    override func awakeFromNib() {
        super.awakeFromNib()

    }
    func didLoading(){
        txtDummy1.showAnimatedGradientSkeleton()
        txtDummy2.showAnimatedGradientSkeleton()
        txtDummy3.showAnimatedGradientSkeleton()
    }

}
