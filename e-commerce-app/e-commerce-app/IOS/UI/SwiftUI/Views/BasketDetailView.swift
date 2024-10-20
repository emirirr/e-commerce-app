//
//  BasketDetailView.swift
//  e-commerce-app
//
//  Created by İsmail Emir Tiryaki on 13.10.2024.
//

import SwiftUI

struct BasketDetailView: View {
    @StateObject public var basketDetailViewModel: BasketDetailViewModel

    var body: some View {
        VStack{
            ScrollView {
                if let basketDetail = basketDetailViewModel.basketDetail {
                    GroupBox {
                        ForEach(basketDetail.urunlerSepeti, id: \.ad) { product in
                            HStack{
                                AsyncImage(url: URL(string:  ServicePaths.BaseUrl.baseUrl + ServicePaths.Product.imagePath + product.resim)) { phase in
                                    switch phase {
                                    case .empty:
                                        ProgressView()
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(height: 100)
                                           
                                    case .failure:
                                        Image(systemName: "photo")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(height: 50)
                                            .padding()
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                                VStack{
                                    HStack {
                                        Text(product.marka ?? "")
                                            .font(.headline)
                                            .foregroundColor(.green)
                                            
                                        Text(product.ad ?? "")
                                            .font(.subheadline)
                                        Spacer()
                                    }
                                    
                                    HStack(spacing: 0){
                                     Text("Adet : ")
                                        LargeButton(title: String(product.siparisAdeti), backgroundColor: Color.white, foregroundColor: Color.green, maxWidth : 30, buttonHorizontalMargins : 5, padding : 1, action:  { })
                                       
                                        Spacer()
                                        HStack(spacing:0){
                                            Text("\(Int(product.fiyat) ?? 0)").font(.headline)
                                            Text("TL").font(.caption)
                                        }.padding(.right,10)
                                    }.padding(.top,10)
                                   
                                }
                                Spacer()
                            }
                          
                        
                            Divider()
                        }

                    }
                    .padding()
                } else {
                    Text("No products in the basket.")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding()
                }
            }
            GroupBox{
                HStack{
                    Text("Toplam").padding(.left,10)
                    Spacer()
                    HStack(spacing:0){
                        Text("\(Int(basketDetailViewModel.totalPrice ?? 0))").font(.headline)
                        Text("TL").font(.caption)
                    }.padding(.right,10)
                   
                }
            }
        }
    }
}
