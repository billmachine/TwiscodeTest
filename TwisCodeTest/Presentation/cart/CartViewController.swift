//
//  CartViewController.swift
//  TwisCodeTest
//
//  Created by Ahmad Billi Afandi on 24/01/21.
//

import UIKit
import MaterialComponents

class CartViewController: UIViewController {
   
    @IBOutlet weak var cartTable: UITableView!
    @IBOutlet weak var bottomCardView: UIView!
    
    public func setViewSettingWithBgShade(view: UIView)
    {
//        view.layer.cornerRadius = 8
//        view.layer.borderWidth = 1
//        view.layer.borderColor = AppTextFieldBorderColor.cgColor

        //MARK:- Shade a view
//        view.layer.shadowOpacity = 0.5
//        view.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
//        view.layer.shadowRadius = 3.0
//        view.layer.shadowColor = UIColor.black.cgColor
//        view.layer.masksToBounds = false
//        bottomCardView.dropShadow()
        
        
      

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        cartTable.register(UINib(nibName: CartTableViewCell.identifier, bundle: nil),
                           forCellReuseIdentifier: CartTableViewCell.identifier)

        cartTable.dataSource = self
        
        
//        bottomCardView.layer.masksToBounds = true
//        bottomCardView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
//        bottomCardView.clipsToBounds = true
//        bottomCardView.layer.cornerRadius = 10
//        bottomCardView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
//        bottomCardView.dropShadow()
//        bottomCardView.layer.cornerRadius = 10

        // border
//        bottomCardView.layer.borderWidth = 1.0
//        bottomCardView.layer.borderColor = UIColor.black.cgColor
//
//        // shadow
//        bottomCardView.layer.shadowColor = UIColor.black.cgColor
//        bottomCardView.layer.shadowOffset = CGSize(width: 3, height: 3)
//        bottomCardView.layer.shadowOpacity = 0.7
//        bottomCardView.layer.shadowRadius = 4.0
        
//        bottomCardView.roundCorners(corners: [.topLeft, .topRight], radius: 30.0)
        
        bottomCardView.clipsToBounds = true
        bottomCardView.layer.cornerRadius = 40
        bottomCardView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner] // Top right corner, Top left corner respectively

//        viewShadow.layer.cornerRadius = 12
        bottomCardView.layer.masksToBounds = true;

        bottomCardView.backgroundColor = UIColor.white
        bottomCardView.layer.shadowColor = UIColor.lightGray.cgColor
        bottomCardView.layer.shadowOpacity = 0.8
        bottomCardView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        bottomCardView.layer.shadowRadius = 6.0
        bottomCardView.layer.masksToBounds = false

        
//        bottomCardView.layer.shadowColor = UIColor.gray.cgColor
//        bottomCardView.layer.shadowOpacity = 0.5
//        bottomCardView.layer.shadowOffset = CGSize.zero
//        bottomCardView.layer.shadowRadius = 60
//
//        bottomCardView.layer.cornerRadius = 40

//        bottomCardView.layer.shadowOpacity = 1
//        bottomCardView.layer.shadowOffset = .zero
//        bottomCardView.layer.shadowRadius = 10
        

//        productCollection.delegate = self
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CartViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView
            .dequeueReusableCell(withIdentifier:CartTableViewCell.identifier, for: indexPath)
            as? CartTableViewCell ?? UITableViewCell()
//            genreCollectioncell?.txtGenre.text = game?.genres?[indexPath.item].name ?? ""
        
//            cell = genreCollectioncell ?? UICollectionViewCell()
        return cell
    }
    
    
}
