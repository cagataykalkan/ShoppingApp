//
//  ViewController.swift
//  ShoppingApp
//
//  Created by Çağatay KALKAN on 2.07.2024.
//

import UIKit

class HomePage: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var productsList = [products]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        let p1 = products(id: 1, name: "Macbook Pro 14", photo: "bilgisayar", price: 43000)
        let p2 = products(id: 2, name: "Rayban Club Master", photo: "gozluk", price: 3500)
        let p3 = products(id: 3, name: "Sony ZX Series", photo: "kulaklik", price: 40000)
        let p4 = products(id: 4, name: "Gio Armani", photo: "parfum", price: 8000)
        let p5 = products(id: 5, name: "Casio X Series", photo: "saat", price: 43000)
        let p6 = products(id: 6, name: "Dyson V8 ", photo: "supurge", price: 18000)
        let p7 = products(id: 7, name: "İphone 13", photo: "telefon", price: 36000)
        
        productsList.append(p1)
        productsList.append(p2)
        productsList.append(p3)
        productsList.append(p4)
        productsList.append(p5)
        productsList.append(p6)
        productsList.append(p7)
    }

    @IBAction func addToBasketPressed(_ sender: Any) {
    }
    
}

extension HomePage: UITableViewDelegate, UITableViewDataSource, CellProtocol {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = productsList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "productsCell") as! ProductsCell
        
        cell.ProductName.text = product.name
        cell.ProductPrice.text = "\(product.price!) ₺"
        cell.ProductImage.image = UIImage(named: product.photo!)
        
        cell.backgroundColor = UIColor(white: 0.95, alpha: 1)
        cell.cellBackground.layer.cornerRadius = 10.0
        cell.selectionStyle = .none
        
        cell.cellProtocol = self
        cell.indexPath = indexPath
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let product = productsList[indexPath.row]
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { contextualAction, view, bool in
            print("\(product.name!) deleted")
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = productsList[indexPath.row]
        performSegue(withIdentifier: "productsToDetail", sender: product)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "productsToDetail" {
            if let product = sender as? products {
                let destinationVC = segue.destination as! DetailPage
                destinationVC.product = product 
            }
        }
    }


    func didTapAddToBasketButton(cell: ProductsCell) {
            if let indexPath = tableView.indexPath(for: cell) {
                let product = productsList[indexPath.row]
                
                print("\(product.name!) added to basket")
            }
    }
    
    func addToBasketButtonTapped(indexPath: IndexPath) {
        let product = productsList[indexPath.row]
        print("\(product.name!) added to basket")
    }
}
