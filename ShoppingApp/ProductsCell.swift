//
//  ProductsCellTableViewCell.swift
//  ShoppingApp
//
//  Created by Çağatay KALKAN on 3.07.2024.
//



import UIKit

protocol CellProtocol {
    func addToBasketButtonTapped(indexPath: IndexPath)
}

class ProductsCell: UITableViewCell {
 
    @IBOutlet weak var cellBackground: UIView!
    @IBOutlet weak var ProductPrice: UILabel!
    @IBOutlet weak var ProductName: UILabel!
    @IBOutlet weak var ProductImage: UIImageView!
 
    var cellProtocol: CellProtocol?
    var indexPath: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func addToBasketButtonTapped(_ sender: Any) {
        if let indexPath = indexPath {
            cellProtocol?.addToBasketButtonTapped(indexPath: indexPath)
        }
    }
}
