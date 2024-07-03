//
//  DetailPage.swift
//  ShoppingApp
//
//  Created by Çağatay KALKAN on 2.07.2024.
//

import UIKit

class DetailPage: UIViewController {
    
    var product:products?

    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let p = product {
            self.navigationItem.title = p.name
            productImage.image = UIImage(named: p.photo!)
            productPrice.text = "\(p.price!) ₺"
        }

    }
    
    @IBAction func addToBasketPressed(_ sender: Any) {
        if let p = product{
            print("----DETAILS PAGE----")
            print("\(p.name!) added basket")
        }
    }
    
   

}
