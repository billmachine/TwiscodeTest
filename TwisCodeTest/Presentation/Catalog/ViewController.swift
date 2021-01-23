//
//  ViewController.swift
//  TwisCodeTest
//
//  Created by Ahmad Billi Afandi on 23/01/21.
//

import UIKit
import Alamofire


class ViewController: UIViewController {
    
    @IBOutlet weak var productCollection: UICollectionView!
    
    let btn = BadgedButtonItem(with: UIImage(named: "ic_cart"))
    
    var products : [Product] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.navigationController?.title = "Catalog"
//        self.title = "Catalog"
        self.navigationController?.navigationBar.topItem?.title = "Catalog"
//        navigationBar.topItem?.title = "Your Title"

        self.navigationItem.rightBarButtonItem = btn

        btn.tapAction = {
            self.btn.setBadge(with: 1)
        }
        
        // Do any additional setup after loading the view.
        let url = "https://ranting.twisdev.com/index.php/rest/items/search/api_key/teampsisthebest/"
        AF.request(url,method: .post)
            .validate()
            .response { response in
                switch response.result {
                case .success(let rawResponse):
                    self.products = self.mapFreakJson(rawResponse)
                    self.productCollection.reloadData()
//                    self.mapFreakJson(rawResponse).map {
//                        print($0.title)
//                    }
                    
                case .failure(let error):
                print(error)
                
                }
                
            }
        
        productCollection.register(UINib(nibName: ProductCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        productCollection.dataSource = self
        productCollection.delegate = self
        
    }
    
    func mapFreakJson(_ rawResponse:Any)-> [Product] {
        let decoder = JSONDecoder()
        let rawResponse = rawResponse as! Data
        var outputProducts : [Product] = []
        
        do {
            let products = try decoder.decode([Product].self, from: rawResponse)
            outputProducts = products
        }
        catch(let message) {
            print(message.localizedDescription)
        }
        
        return outputProducts
    }
    
//    func mapFreakJson(_ rawResponse:Any)-> [Product] {
//        let decoder = JSONDecoder()
//        let rawResponse = rawResponse as! NSArray
//        var outputProducts : [Product] = []
//        rawResponse.map{
//            let productRaw = $0
//            do {
//                let serializedProduct = try JSONSerialization.data(withJSONObject: productRaw, options: [])
//                do{
//                    let product = try decoder.decode(Product.self, from: serializedProduct)
//                    outputProducts.append(product)
//                }
//                catch(let message) { print(message.localizedDescription) }
//            }
//            catch(let message) { print(message.localizedDescription) }
//        }
//        return outputProducts
//    }
    
    
}

extension ViewController:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if collectionView == genreCollection {
        return //2
        products.count
//        } else if collectionView == ssCollection {
//            return game?.ss?.count ?? 0
//        }
//        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        var cell = UICollectionViewCell()
//        if collectionView == genreCollection {
            let cell = collectionView
                .dequeueReusableCell(withReuseIdentifier:ProductCollectionViewCell.identifier, for: indexPath)
                as? ProductCollectionViewCell ?? UICollectionViewCell()
//            genreCollectioncell?.txtGenre.text = game?.genres?[indexPath.item].name ?? ""
            
//            cell = genreCollectioncell ?? UICollectionViewCell()
            return cell
//        } else if collectionView == ssCollection {
//            let ssCollectioncell = collectionView
//                .dequeueReusableCell(withReuseIdentifier:"SSCollectionViewCell", for: indexPath)
//                as? SSCollectionViewCell ?? nil
//
//            let ss = game?.ss?[indexPath.item]
//
//            ssCollectioncell?.ssImage.sd_imageIndicator = SDWebImageActivityIndicator.grayLarge
//
//            ssCollectioncell?.ssImage.sd_setImage(with: ss?.imageURL,completed: { (image,error,cacheType,url) in
//
//            })
//
//            return ssCollectioncell ?? UICollectionViewCell()
//        }
//        return UICollectionViewCell()
    }
    
}


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
