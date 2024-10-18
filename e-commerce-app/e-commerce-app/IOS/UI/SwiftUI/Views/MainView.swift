//
//  MainView.swift
//  e-commerce-app
//
//  Created by İsmail Emir Tiryaki on 13.10.2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack(spacing: 0){
            AppBarComponent()
            ScrollView{
                VStack{
                    VStack(spacing: 0) {
                        // Ürün Kartları
                            ScrollView {
                                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                                    ForEach(0..<10) { _ in
                                        ProductCard()
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                    .background(Color(.systemGray6).ignoresSafeArea()) // Arka plan rengi
                }
            }

        }
       

        // Ürün Kartı Bileşeni
        
        }
    


#Preview {
    MainView()
}
struct ProductCard: View {
    var body: some View {
        VStack {
            // Görsel (Kulaklık)
            Image("headphones") // Asset dosyasındaki kulaklık resmi
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 150)
                .padding()

            Text("TMA-2 HD Wireless")
                .font(.headline)

            Text("USD 350")
                .font(.subheadline)
                .foregroundColor(.gray)

            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text("4.6")
                Text("(86 Reviews)")
                    .foregroundColor(.gray)
            }
            .font(.caption)
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
        
    }
