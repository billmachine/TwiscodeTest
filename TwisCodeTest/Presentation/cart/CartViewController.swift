//
//  CartViewController.swift
//  TwisCodeTest
//
//  Created by Ahmad Billi Afandi on 24/01/21.
//

import UIKit
import RxSwift
import RxCocoa


class CartViewController: UIViewController {
    
    @IBOutlet weak var cartTable: UITableView!
    @IBOutlet weak var bottomCardView: UIView!
    @IBOutlet weak var txtTotal: UILabel!
    
    lazy var viewModel : CartViewModel = CartViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        
        _ = viewModel.displayedStrTotal.subscribe { total in
            let fmt = NumberFormatter()
            fmt.numberStyle = .decimal
            if let totalInt = Int(total.element ?? "0"){
                if let total = fmt.string(from: NSNumber(value: totalInt)) {
                    DispatchQueue.main.async {
                        self.txtTotal.text = "Rp "+total+" ,00"
                    }
                }
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cartTable.register(UINib(nibName: CartTableViewCell.identifier, bundle: nil),forCellReuseIdentifier: CartTableViewCell.identifier)
        self.setupView()
        
        _ = viewModel.displayedCart
            .observeOn(MainScheduler.instance)
            .bind(to: cartTable.rx.items) { tableView,row,product -> UITableViewCell in
                let indexPath = IndexPath.init(row: row, section: 0)
                guard let cell = tableView
                        .dequeueReusableCell(withIdentifier:CartTableViewCell.identifier, for: indexPath)
                        as? CartTableViewCell else { return UITableViewCell() }
                cell.fill(product: product)
                return cell
            }
    }
    
}
