//
//  ProductModel.swift
//  e-commerce-app
//
//  Created by İsmail Emir Tiryaki on 13.10.2024.
//

import Foundation

class ProductModel : Codable, Hashable {
    
    public var id: Int? = 0
    public var ad: String? = ""
    public var resim: String? = ""
    public var kategori: String? = ""
    public var fiyat: Int? = 0
    public var marka: String? = ""
    
    static func == (lhs: ProductModel, rhs: ProductModel) -> Bool {
        return false
    }
    func hash(into hasher: inout Hasher) {

    }
}
