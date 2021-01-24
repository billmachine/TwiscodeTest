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
    @IBOutlet weak var quantityStepper: UIStepper!
    
    var btnQuantityDown: (() -> ())?
    var btnQuantityUp: (() -> ())?
    var onchangeQuantity: ((String) -> ())?
    
    @IBAction func quantityStepperAction(_ sender: UIStepper) {
        if(sender.value == 0.0){
            btnQuantityDown?()
        } else {
            btnQuantityUp?()
        }
        quantityStepper.value = 0.5
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        quantityStepper.maximumValue = 1.0
        quantityStepper.minimumValue = 0.0
        quantityStepper.value = 0.5
        etQuantity.delegate = self
        etQuantity.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)

    }
    
    @objc func textFieldDidChange(textField: UITextField) {
        self.onchangeQuantity!(textField.text ?? "")
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
    }
    
}

extension CartTableViewCell : UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        print(textField.tag)
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        if allowedCharacters.isSuperset(of: characterSet) == false { return false }
        
        guard let text = textField.text else { return true }
        let newLength = text.count + string.count - range.length
        return newLength <= 3
    }
}
