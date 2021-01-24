//
//  ViewController.swift
//  TwisCodeTest
//
//  Created by Ahmad Billi Afandi on 23/01/21.
//

import UIKit
import RxSwift


class ViewController: UIViewController {
    
    var placeholderError : PlaceholderError?
    
    @IBOutlet weak var productCollection: UICollectionView!
    
    let viewModel : CatalogViewModel = CatalogViewModel()
    
    let cartBtn = BadgedButtonItem(with: UIImage(named: "ic_cart"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = "Catalog"
        self.navigationItem.rightBarButtonItem = cartBtn

        cartBtn.tapAction = {
            self.gotoCart()
        }
        
        productCollection.register(UINib(nibName: ProductCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        
        productCollection.register(UINib(nibName: DummyCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DummyCollectionViewCell.identifier)
        
        productCollection.delegate = self
        
        _ = viewModel.displayedProduct
            .observeOn(MainScheduler.instance)
            .bind(to: productCollection.rx.items) { tableView,row,product -> UICollectionViewCell in
                
                if self.viewModel.displayedShimmerState.value == true {
                    let indexPath = IndexPath.init(row: row, section: 0)
                    guard let cell = tableView.dequeueReusableCell(
                            withReuseIdentifier: DummyCollectionViewCell.identifier, for: indexPath) as? DummyCollectionViewCell
                    else { return UICollectionViewCell()}
                    cell.didLoading()
                    return cell
                }
                else {
                    let indexPath = IndexPath.init(row: row, section: 0)
                    guard let cell = tableView.dequeueReusableCell(
                            withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as? ProductCollectionViewCell
                    else { return UICollectionViewCell()}
                    cell.fill(product: product)
                    return cell
                }
                
            }
            //.disposed(by: listViewModel.disposeBag)
        
        _ = viewModel.displayedisError.subscribe {  showError in
                self.observeisError(error: showError)
        }
        
        _ = viewModel.displayedisInfo.subscribe {  warning in
//            guard let info = warning else { return }
            self.observeisInfo(string: warning)
//            DispatchQueue.main.async {
//                let alert = UIAlertController(title: "Info", message: warning.element ?? "", preferredStyle: .alert)
//                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
//                self.present(alert, animated: true)
//            }
        }
        
        _ = viewModel.displayedCart.subscribe {  localProduct in
            DispatchQueue.main.async {
                let notif = localProduct.element?.count ?? 0
                print(notif)
                
            self.cartBtn.setBadge(with: localProduct.element?.count ?? 0)
            }
        }
        
        productCollection
                .rx
                .modelSelected(Product.self)
                .subscribe(onNext: { (model) in
                    if self.viewModel.displayedShimmerState.value == true { return }
                    self.viewModel.addProducttoCart(product: model)
                })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.fetchCartData()
    }
    
    func gotoCart(){
        guard let vc = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "CartViewController") as? CartViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func observeisInfo(string:String?){
        if let value = string {
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "Info", message: value ?? "", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
        }
    }
    
    func observeisError(error:Error?){
        if let error = error {
            productCollection.isHidden = true
            let alert = UIAlertController(title: "Oops error ", message: "\(error.localizedDescription)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        else {
            productCollection.isHidden = false
        }
    }
}

extension ViewController:PlaceholderErrorDelegate {
    func clicked(sender: Any) {
        self.viewModel.getData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "PlaceholderErrorSegue") {
            placeholderError = segue.destination as? PlaceholderError
            placeholderError?.delegate = self
        }
    }
}

class PlaceholderError : UIViewController {
    var delegate :PlaceholderErrorDelegate?
    @IBAction func buttonRefreshOnClicked(_ sender: Any) {
        delegate?.clicked(sender: sender)
    }
}

protocol PlaceholderErrorDelegate {
    func clicked(sender:Any)
}



