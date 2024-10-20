//
//  ServicePaths.swift
//  e-commerce-app
//
//  Created by İsmail Emir Tiryaki on 13.10.2024.
//

import Foundation

class  ServicePaths {}

extension ServicePaths {
    class Product {
        static let list = "urunler/tumUrunleriGetir.php"
        static let imagePath = "urunler/resimler/"
    }
    class Basket {
        static let list = "urunler/sepettekiUrunleriGetir.php"
        static let set = "urunler/sepeteUrunEkle.php"
        static let delete = "urunler/sepettenUrunSil.php"
    }
    class BaseUrl{
        static let baseUrl = "http://kasimadalan.pe.hu/"
    }
    class Constans{
        static let userName = "ismail_emir"
    }
}
    
