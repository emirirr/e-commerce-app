//
//  ProductListViewModel.swift
//  e-commerce-app
//
//  Created by İsmail Emir Tiryaki on 13.10.2024.
//

import Foundation
import UIKit

class ProductListViewModel: ObservableObject {
  
    let productService = ProductService()
    @Published public var productList: ProductListModel?

    func getProductList() async {
        let response = await productService.getProductList()
        productList = response
    }
}
