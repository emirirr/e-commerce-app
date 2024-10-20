//
//  ProductDetailBottomBarComponent.swift
//  e-commerce-app
//
//  Created by İsmail Emir Tiryaki on 13.10.2024.
//

import SwiftUI

struct ProductDetailBottomBarComponent: View {
    @StateObject public var productDetailViewModel: ProductDetailViewModel
    public let onTapAddToCart: () async -> ()
    public let onTapDeleteProduct: () async -> ()
    
    var body: some View {
        VStack(){
            
            HStack {
                HStack(spacing:0){
                    Text("\(productDetailViewModel.detailProduct?.fiyat ?? 0)").font(.headline)
                    Text("TL").font(.caption)
                }
                
                Spacer()
                
                if !productDetailViewModel.isBasketAdedd {
                    LargeButton(title: "Sepete ekle", backgroundColor: Color.green, foregroundColor: Color.white, maxWidth : 200, buttonHorizontalMargins : 10, padding : 12, action:  {   Task {
                        await self.onTapAddToCart()
                    }})
                }else {
                    HStack{
                        LargeButton(title: "-", backgroundColor: Color.green, foregroundColor: Color.white, maxWidth : 50, buttonHorizontalMargins : 5, padding : 10, action:  { Task{await self.onTapDeleteProduct()}})
                        LargeButton(title: String(productDetailViewModel.productCount), backgroundColor: Color.white, foregroundColor: Color.green, maxWidth : 50, buttonHorizontalMargins : 5, padding : 10, action:  { })
                        LargeButton(title: "+", backgroundColor: Color.green, foregroundColor: Color.white, maxWidth : 50, buttonHorizontalMargins : 5, padding : 10, action:  {Task {await self.onTapAddToCart()} })
                    }.padding(.right,20)
                }
               
            }.padding(.left,20)
        }
    }
}

