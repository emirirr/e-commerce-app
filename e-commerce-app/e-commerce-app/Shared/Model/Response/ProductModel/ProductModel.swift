//
//  ProductModel.swift
//  e-commerce-app
//
//  Created by İsmail Emir Tiryaki on 13.10.2024.
//

import Foundation

class ProductModel : Codable {
    
    public var id: Int? = 0
    public var ad: String? = ""
    public var resim: String? = ""
    public var kategori: String? = ""
    public var fiyat: Int? = 0
    public var marka: String? = ""

}
