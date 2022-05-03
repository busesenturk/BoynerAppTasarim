//
//  ProductModel.swift
//  BoynerAppTasarim
//
//  Created by Buse Şentürk on 3.05.2022.
//

import Foundation

class ProductModel {
    var productViewName: String?
    var productBrandName: String?
    var productKind: String?
    var firstPrice: String?
    var secondPrice: String?
    var basketPrice: String?
    
    init(productViewName: String, productBrandName: String, productKind: String, firstPrice: String, secondPrice: String, basketPrice: String) {
        self.productViewName = productViewName
        self.productBrandName = productBrandName
        self.productKind = productKind
        self.firstPrice = firstPrice
        self.secondPrice = secondPrice
        self.basketPrice = basketPrice
    }
}
