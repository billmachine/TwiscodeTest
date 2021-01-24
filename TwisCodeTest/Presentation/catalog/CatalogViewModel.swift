//
//  CatalogViewModel.swift
//  TwisCodeTest
//
//  Created by Ahmad Billi Afandi on 24/01/21.
//

import RxSwift
import RxCocoa
import Foundation
import UIKit


class CatalogViewModel{
    
    var products: [Product] = []
    
    var displayedProduct  = BehaviorRelay<[Product]>(value: [])
    var displayedisError  = BehaviorRelay<Error?>(value: nil)
    var displayedShimmerState : BehaviorRelay<Bool> = BehaviorRelay(value:false)
    var displayedisInfo  = PublishRelay<String?>()
    
    var displayedCart  = BehaviorRelay<[Product]>(value: [])
    
    let dummyProducts = [Product(),Product(),Product(),Product(),Product(),Product(),Product()]
    
    private lazy var local: LocalSource = { return LocalSource() }()
    
    init() {
        self.getData()
        self.fetchCartData()
    }
    
    func getData() {
        self.displayedisError.accept(nil)
        DispatchQueue.global(qos:.background).async {
            if(self.products.isEmpty) {
                DispatchQueue.main.async {
                    self.displayedProduct.accept(self.dummyProducts)
                    self.displayedShimmerState.accept(true)
                }
        }
        RemoteSource.getData{ result in
            switch result {
            case .failure(let error):
                print("error getData \(error) \(error.localizedDescription)")
                self.displayedisError.accept(error)
            case let .success(fact):
                DispatchQueue.main.async {
                self.displayedProduct.accept(fact)
                self.products = fact ?? []
                }
            }
            DispatchQueue.main.async {
            self.displayedShimmerState.accept(false)
            }
        }
        }
    }
    
    func fetchCartData(){
        local.getAll{ result in
            self.displayedCart.accept(result)
        }
    }
    
    func addProducttoCart(product:Product){
        func addNew(){
            local.create(product.id ?? "",
                         product.price ?? "",
                         product.title ?? "",
                         product.weight ?? "",
                         "1",
                         product.default_photo?.img_path ?? "",
                         product.condition_of_item?.name ?? ""
            ){
                self.fetchCartData()
                self.displayedisInfo.accept("Berhasil Menambah Produk Baru")
            }
        }
        func updateCurrent(oldProduct:Product){
            let newQuantity = Int( oldProduct.quantity ?? "0")! + 1
            product.quantity = String(newQuantity)
            self.local.update(product){ _ in
                self.displayedisInfo.accept("Berhasil Mengupdate Cart")
            }
        }
        
        guard let productId = product.id else {
            self.displayedisInfo.accept("Product Id Kosong")
            return }
        
        local.getById(productId) { result in
            if result != nil {
                updateCurrent(oldProduct: result!)
            } else {
                addNew()
            }
        }
    }
}
