//
//  ProductCollectionViewCell.swift
//  TwisCodeTest
//
//  Created by Ahmad Billi Afandi on 23/01/21.
//

import UIKit
import SkeletonView
import SDWebImage

class ProductCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: ProductCollectionViewCell.self)
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelLocation: UILabel!
    @IBOutlet weak var labelUser: UILabel!
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var isAvailable: UIButton!
    @IBOutlet weak var isHalal: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib() 
        
    }
    
    func fill(product:Product) {
        labelTitle.text = product.title
        
        if let price = product.price {
            let fmt = NumberFormatter()
            fmt.numberStyle = .decimal
            if let priceInt = Int(price){
                if let price = fmt.string(from: NSNumber(value: priceInt)) {
                    labelPrice.text = "Rp \(price),00"
                }
            }
        }
        
        labelLocation.text = product.location_name
        labelUser.text = product.added_user_name
        if product.is_halal == "0" {
            isHalal.isHidden = true
        }
        if product.is_available == "0" {
            isAvailable.isHidden = true
        }
        
        imgProduct.image = nil
        imgProduct.backgroundColor = .silver
        imgProduct.sd_imageIndicator = SDWebImageActivityIndicator.grayLarge
        let urlStr = "\(RemoteSource.baseurlImage)\(product.default_photo?.img_path ?? "" )".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        imgProduct.sd_setImage(with: URL(string: urlStr ?? ""),
                               completed: { (image,error,cacheType,url) in
                                if (error != nil) {
                                    self.imgProduct.image = UIImage(named: "ic_placeholder")
                                }
                               })
        
    }
    
}
