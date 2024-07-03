//
//  products.swift
//  ShoppingApp
//
//  Created by Çağatay KALKAN on 2.07.2024.
//

import Foundation

class products {
    var id:Int?
    var name:String?
    var photo:String?
    var price:Int?
    
    init(){
        
    }
    
    init(id: Int, name: String, photo: String, price: Int) {
        self.id = id
        self.name = name
        self.photo = photo
        self.price = price
    }
}
