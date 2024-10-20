//
//  GetBasketListRequest.swift
//  e-commerce-app
//
//  Created by İsmail Emir Tiryaki on 13.10.2024.
//

import Foundation

class GetBasketListRequest<T: BasketListModel>  : RequestBuilder<T> {
   
    init(GetBasketListRequestModel : GetBasketListRequestModel) {
        super.init(
            path:  ServicePaths.Basket.list,
                    method: .post,
                    body: nil,
            parameters: ["kullaniciAdi" : GetBasketListRequestModel.kullaniciAdi ?? ""])
    }
}
