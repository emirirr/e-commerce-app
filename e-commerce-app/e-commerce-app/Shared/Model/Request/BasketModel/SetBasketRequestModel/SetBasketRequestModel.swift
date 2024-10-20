//
//  SetBasketRequestModel.swift
//  e-commerce-app
//
//  Created by İsmail Emir Tiryaki on 13.10.2024.
//

import Foundation

class SetBasketRequestModel : Codable {
    public var ad: String = ""
    public var resim: String = ""
    public var kategori: String = ""
    public var fiyat: Int = 0
    public var marka: String = ""
    public var siparisAdeti: Int = 0
    public var kullaniciAdi: String = ""
}
