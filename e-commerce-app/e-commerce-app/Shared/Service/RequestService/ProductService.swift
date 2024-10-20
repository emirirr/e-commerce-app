//
//  ProductService.swift
//  e-commerce-app
//
//  Created by İsmail Emir Tiryaki on 13.10.2024.
//

import Foundation

class ProductService : ObservableObject{
    private let mw : Middleware = Middleware()
    
    public func getProductList() async -> ProductListModel? {
        
        let productListRequest = GetProductRequest<ProductListModel>()
        do {
            let productListResponse = try await mw.send(request: productListRequest)
            
            return productListResponse
        }catch{
            
        }
        return nil
    }
}
