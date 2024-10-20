//
//  DeleteBasketRequest.swift
//  e-commerce-app
//
//  Created by İsmail Emir Tiryaki on 13.10.2024.
//

import Foundation

class DeleteBasketRequest<T: BasketListModel>  : RequestBuilder<T> {
   
    init(deleteBasketRequestModel : DeleteBasketRequestModel) {
        super.init(
            path:  ServicePaths.Basket.delete,
                    method: .post,
                    body: nil,
            parameters: ["kullaniciAdi" : deleteBasketRequestModel.kullaniciAdi ?? "", "sepetId" : deleteBasketRequestModel.sepetId ?? "",])
    }
}
