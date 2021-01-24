//
//  CartTableViewCell.swift
//  TwisCodeTest
//
//  Created by Ahmad Billi Afandi on 24/01/21.
//

import UIKit
import SDWebImage

class CartTableViewCell: UITableViewCell {
    static let identifier = String(describing: CartTableViewCell.self)
    
    @IBOutlet weak var imgCart: UIImageView!
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var txtPrice: UILabel!
    @IBOutlet weak var txtCondition: UILabel!
    @IBOutlet weak var etQuantity: UITextField!
    @IBOutlet weak var txtWeight: UILabel!
   
    var btnQuantityUp:(()-> Void)?
    var btnQuantityDown:(()-> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func fill(product:Product){
        txtTitle.text = product.title
        
        txtCondition.text = product.condition_of_item?.name
        
        etQuantity.text = product.quantity
        
        
        if let weight = Double( product.weight ?? "0") {
            let weightinKg = weight/1000.0
            txtWeight.text = "\(weightinKg) Kg"
        }
        
        if let price = product.price {
            let fmt = NumberFormatter()
            fmt.numberStyle = .decimal
            if let priceInt = Int(price){
                if let price = fmt.string(from: NSNumber(value: priceInt)) {
                    txtPrice.text = "Rp \(price),00"
                }
            }
        }
        
        imgCart.image = nil
        imgCart.backgroundColor = .silver
        imgCart.sd_imageIndicator = SDWebImageActivityIndicator.grayLarge
        let urlStr = "\(RemoteSource.baseurlImage)\(product.default_photo?.img_path ?? "" )".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        imgCart.sd_setImage(with: URL(string: urlStr ?? ""),
                               completed: { (image,error,cacheType,url) in
                                if (error != nil) {
                                    self.imgCart.image = UIImage(named: "ic_placeholder")
                                }
        })
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
