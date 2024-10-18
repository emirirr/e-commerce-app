//
//  GetProductRequest.swift
//  e-commerce-app
//
//  Created by İsmail Emir Tiryaki on 13.10.2024.
//

import Foundation

class GetProductRequest<T: ProductListModel>  : RequestBuilder<T> {
   
    init() {
        super.init(
                    path:  ServicePaths.Product.list,
                    method: .get,
                    body: nil,
                    parameters: nil)
    }
}
