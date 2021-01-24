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

enum ListPageState {
    case empty,loaded
}

class CartViewModel{
    var displayedCart  = BehaviorRelay<[Product]>(value: [])
    var displayedStrTotal  = BehaviorRelay<String>(value: "0")
    
    var state = BehaviorRelay<ListPageState>(value: .empty)
    
    private lazy var local: LocalSource = { return LocalSource() }()

    init() {
        getCart()
        refreshGetTotal()
    }
    
    func getCart(){
        self.state.accept(.empty)
        local.getAll{ result in
            self.displayedCart.accept(result)
            if result.count > 0
            { self.state.accept(.loaded) }
        }
    }
    
    func refreshGetTotal(){
        DispatchQueue.global(qos: .background).async {
            var total = 0
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
            }
        }
    }
    
    func decreaseQuantity(product:Product,completion: @escaping (Product?) -> Void) {
        if let productId = product.id {
            if product.quantity == "1"
            {
                self.local.delete(productId){
                    self.getCart()
                    self.refreshGetTotal()
                }
                self.state.accept(.empty)
            }
            else {
                local.getById(productId ) { result in
                    if let oldQuantity = Int(result?.quantity ?? "2") {
                        let newQuantity = oldQuantity - 1
                        product.quantity = "\(newQuantity)"
                        self.local.update(product){ _ in
                            completion(product)
                            self.refreshGetTotal()
                        }
                    }
                }
            }
        } else {
            completion(nil)
        }
    }
    
    func increaseQuantity(product:Product,completion: @escaping (Product?) -> Void) {
        if let productId = product.id {
            local.getById(productId ) { result in
                if let oldQuantity = Int(result?.quantity ?? "2") {
                    let newQuantity = oldQuantity + 1
                    product.quantity = "\(newQuantity)"
                    self.local.update(product){ _ in
                        completion(product)
                        self.refreshGetTotal()
                    }
                }
            }
        }
    }
    
    func updateProduct(product:Product){
        self.local.update(product){ _ in
            self.refreshGetTotal()
        }
    }
    
}
