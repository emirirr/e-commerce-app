//
//  ProductDetailView.swift
//  e-commerce-app
//
//  Created by İsmail Emir Tiryaki on 13.10.2024.
//

import SwiftUI

struct ProductDetailView: View {
    public let onTapBack: () -> ()
    public let onTapAddToCart: () async -> ()
    public let onTapDeleteProduct: () async -> ()
    

    @StateObject public var productDetailViewModel: ProductDetailViewModel
    
    var body: some View {
        VStack{
            AppBarTitleComponent(title: "Ürün Detayı", onTapBack: { self.onTapBack() })
            ScrollViewReader { proxy in
                ScrollView {
                    VStack {
                      
                        VStack {
                            Divider()
                            if let productImage = productDetailViewModel.detailProduct?.resim {
                                let imageUrl = ServicePaths.BaseUrl.baseUrl + ServicePaths.Product.imagePath + productImage
                                AsyncImage(url: URL(string: imageUrl)) { phase in
                                    switch phase {
                                    case .empty:
                                        ProgressView()
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(height: 300)
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
                            Divider()
                        }
                        .background(Color(.systemGray6).ignoresSafeArea())
                        .id("top")
                        
                        VStack {
                            HStack {
                                Text(productDetailViewModel.detailProduct?.marka ?? "")
                                    .font(.headline)
                                    .foregroundColor(.green)
                                    .padding(.left, 10)
                                Text(productDetailViewModel.detailProduct?.ad ?? "")
                                    .font(.subheadline)
                                Spacer()
                            }.padding(.top, 10)
                            
                            HStack {
                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .padding(.left, 10)
                            .padding(.top, 10)
                            
                            HStack {
                                Image("rating")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 15)
                                Text("4.4")
                                Text("611 Değerlendirme").foregroundColor(.green)
                                Spacer()
                            }.padding(.left, 15).padding(.top, 10)
                            
                            GroupBox {
                                HStack {
                                    Text("Tahmini 20 Ekim, Pazar Kapında").font(.system(size: 15))
                                    Spacer()
                                    Image("cargo")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30)
                                }
                            }
                            .padding(.left, 10)
                            .padding(.right, 10)
                            .padding(.bottom, 10)
                            
                            Divider()
                            VStack {
                                Spacer(minLength: 5)
                            }
                            Divider()
                            HStack {
                                Image("avatar")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 45)
                                    .padding(.right, 10)
                                    .padding(.bottom, 10)
                                
                                VStack {
                                    HStack {
                                        Text("Tiraki Ticaret").foregroundColor(.green)
                                        Spacer()
                                    }
                                    HStack {
                                        Text("9.7")
                                        Spacer()
                                    }
                                }
                                Spacer()
                                
                                LargeButton(title: "Takip et, kazan", backgroundColor: Color.white, foregroundColor: Color.green, action: {}).padding(.right, 10)
                            }
                            .padding(.left, 10)
                            .padding(.top, 10)
                            
                            
                            VStack(spacing : 2){
                                HStack{
                                    Text("Satıcının diğer ürünleri")   .font(.subheadline)
                                        .foregroundColor(.gray)
                                    Spacer()
                                }.padding(.left,10)
                                HStack {
                                    if let products = productDetailViewModel.productList?.urunler {
                                        ScrollView(.horizontal) {
                                            HStack(spacing: 16) {
                                                ForEach(products, id: \.id) { product in
                                                    ProductCardComponent(product: product, onTapDetail: { product in
                                                        productDetailViewModel.detailProduct = product
                                                        withAnimation {
                                                            proxy.scrollTo("top", anchor: .top)
                                                        }
                                                    })
                                                    .padding(.bottom, 10)
                                                }
                                            }
                                            .padding(.horizontal)
                                        }
                                    } else {
                                        Text("No products available")
                                    }
                                }
                                .background(Color(.systemGray6).ignoresSafeArea())
                            }
                        }
                    }
                    .background(Color.white)
                    .padding(.top, 10)
                    .cornerRadius(10)
                }
            }
            ProductDetailBottomBarComponent(productDetailViewModel: productDetailViewModel,onTapAddToCart: {Task{await self.onTapAddToCart()}}, onTapDeleteProduct: {Task{await self.onTapDeleteProduct()}})
        }
    }
}
