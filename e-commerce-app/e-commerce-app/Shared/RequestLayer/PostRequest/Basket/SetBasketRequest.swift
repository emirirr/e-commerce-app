//
//  SetBasketRequest.swift
//  e-commerce-app
//
//  Created by İsmail Emir Tiryaki on 13.10.2024.
//

import Foundation

class SetBasketRequest<T: BasketListModel>  : RequestBuilder<T> {
   
    init(setBasketRequestModel : SetBasketRequestModel) {
        super.init(
            path:  ServicePaths.Basket.set,
                    method: .post,
                    body: nil,
                    parameters: [
                        "resim": setBasketRequestModel.resim,
                        "kategori": setBasketRequestModel.kategori,
                        "fiyat": setBasketRequestModel.fiyat,
                        "kullaniciAdi": setBasketRequestModel.kullaniciAdi,
                        "marka": setBasketRequestModel.marka,
                        "ad": setBasketRequestModel.ad,
                        "siparisAdeti": setBasketRequestModel.siparisAdeti
                    ])
    }
}
