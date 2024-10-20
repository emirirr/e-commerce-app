//
//  BasketListModel.swift
//  e-commerce-app
//
//  Created by İsmail Emir Tiryaki on 13.10.2024.
//

import Foundation

class BasketListModel: Codable {
    var urunlerSepeti: [UrunModel] = []
    var success: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case urunlerSepeti = "urunler_sepeti"
        case success
    }
}

class UrunModel: Codable {
    var sepetId: Int = 0
    var ad: String = ""
    var resim: String = ""
    var kategori: String = ""
    var fiyat: Double = 0.0
    var marka: String = ""
    var siparisAdeti: Int = 0
    var kullaniciAdi: String = ""
    
    enum CodingKeys: String, CodingKey {
        case sepetId = "sepetId"
        case ad
        case resim
        case kategori
        case fiyat
        case marka
        case siparisAdeti = "siparisAdeti"
        case kullaniciAdi = "kullaniciAdi"
    }
    
    
}
