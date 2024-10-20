//
//  ProductListView.swift
//  e-commerce-app
//
//  Created by İsmail Emir Tiryaki on 13.10.2024.
//

import SwiftUI

struct ProductListView: View {
    @StateObject public var productListViewModel: ProductListViewModel
    public let onTapDetail: (_ product: ProductModel) -> ()
    
    var body: some View {
        ScrollView {
            VStack {
                VStack(spacing: 0) {
                    if let products = productListViewModel.productList?.urunler {
                        ScrollView {
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                                ForEach(products, id: \.id) { product in
                                    ProductCardComponent(product: product,onTapDetail: { product in
                                        self.onTapDetail(product)
                                    })
                                }
                            }
                            .padding(.horizontal)
                        }
                    } else {
                        Text("No products available")
                    }
                }
            }
            .background(Color(.systemGray6).ignoresSafeArea())
        }
    }
}
