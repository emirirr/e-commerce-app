//
//  MainView.swift
//  e-commerce-app
//
//  Created by İsmail Emir Tiryaki on 13.10.2024.
//

import SwiftUI

struct MainView: View {
    
    @StateObject public var mainViewModel: MainViewModel
    @StateObject public var productListViewModel : ProductListViewModel
    @StateObject public var basketDetailViewModel : BasketDetailViewModel
    public let onTapDetail: (_ product: ProductModel) -> ()


    var body: some View {
        VStack(spacing: 0) {
            AppBarComponent()
            switch mainViewModel.selectedPageIndex {
            case 0:
                ProductListView(productListViewModel: self.productListViewModel, onTapDetail: {product in self.onTapDetail(product)})
            default:
                BasketDetailView(basketDetailViewModel: basketDetailViewModel)
            }
            BottomBarComponent(mainViewModel: self.mainViewModel, basketDetailViewModel: basketDetailViewModel)
        }
    }
}

