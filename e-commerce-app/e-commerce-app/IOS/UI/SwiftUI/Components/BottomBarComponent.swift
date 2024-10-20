//
//  BottomBarComponent.swift
//  e-commerce-app
//
//  Created by İsmail Emir Tiryaki on 13.10.2024.
//

import SwiftUI

struct BottomBarComponent: View {
    
    @StateObject public var mainViewModel: MainViewModel
    @StateObject public var basketDetailViewModel: BasketDetailViewModel

    var body: some View {
        VStack {
            if( mainViewModel.selectedPageIndex == 0){
                           HStack{
                               Divider().frame(width: UIScreen.main.bounds.width / 2, height: 3)
                                   .overlay(.green)
                               Spacer()
                           }
                       }
                    
                       if( mainViewModel.selectedPageIndex  == 1){
                           
                           HStack{
                               Spacer()
                               Divider().frame(width: UIScreen.main.bounds.width / 2, height: 3)
                                   .overlay(.green)
                               
                           }
                       }
            HStack {
                Button(action: {
                    mainViewModel.selectedPageIndex = 0
                }) {
                    VStack {
                        Image(systemName: mainViewModel.selectedPageIndex == 0 ? "house.fill" : "house")
                            .font(.system(size: 24))
                            .foregroundColor(.green)
                      
                    }
                }
                .frame(maxWidth: .infinity)

                Button(action: {
                    mainViewModel.selectedPageIndex = 1
                    Task{
                        await  basketDetailViewModel.getBasketDetail()
                    }
                }) {
                    VStack {
                        Image(systemName: mainViewModel.selectedPageIndex == 1 ? "cart.fill" : "cart")
                            .font(.system(size: 24))
                            .foregroundColor(.green)
                       
                    }
                }
                .frame(maxWidth: .infinity)

            
            }
            .padding()
            .background(Color.white)
        }
    }
}
