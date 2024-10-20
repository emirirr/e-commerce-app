//
//  ProductCardComponent.swift
//  e-commerce-app
//
//  Created by İsmail Emir Tiryaki on 13.10.2024.
//

import SwiftUI

struct ProductCardComponent: View {
    let product: ProductModel
    public let onTapDetail: (_ product: ProductModel) -> ()
    
    var body: some View {
        Button(action: {
            onTapDetail(product)
        }) {
            VStack {
                if let productImage = product.resim {
                    let imageUrl = ServicePaths.BaseUrl.baseUrl + ServicePaths.Product.imagePath + productImage
                    AsyncImage(url: URL(string: imageUrl)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 150)
                                .padding()
                        case .failure:
                            Image(systemName: "photo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 150)
                                .padding()
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
                
                VStack {
                    Text(product.ad ?? "")
                        .font(.headline)
                    
                    Text("\(product.fiyat ?? 0) TL")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.bottom, 20)
            }
            .background(Color.white)
            .padding(.top, 10)
            .cornerRadius(10)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
