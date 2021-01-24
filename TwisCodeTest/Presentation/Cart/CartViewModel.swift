//
//  CartViewModel.swift
//  TwisCodeTest
//
//  Created by Ahmad Billi Afandi on 24/01/21.
//

import RxSwift
import RxCocoa
import Foundation
import UIKit

class CartViewModel{
    var displayedCart  = BehaviorRelay<[Product]>(value: [])
    var displayedStrTotal  = BehaviorRelay<String>(value: "0")
    
    private lazy var local: LocalSource = { return LocalSource() }()

    init() {
        getCart()
        refreshGetTotal()
    }
    
    func getCart(){
        local.getAll{ result in
            self.displayedCart.accept(result)
        }
    }
    
    func refreshGetTotal(){
        var total = 0
//       let observeTotal = Observable<Int>.create { observer in
        self.local.getAll { result in
            result.map {
                product in
                var totalPerProduct = 0
                if let priceInt = Int(product.price ?? "0"),let quantityInt = Int(product.quantity ?? "0"){
                    totalPerProduct = priceInt * quantityInt
                    total += totalPerProduct
                }
            }
            self.displayedStrTotal.accept("\(total)")
//            print(total)
            

//            }

        }

//

    }
    
}
