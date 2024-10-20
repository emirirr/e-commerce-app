//
//  MainViewController.swift
//  e-commerce-app
//
//  Created by İsmail Emir Tiryaki on 13.10.2024.
//

import SwiftUI
import UIKit
import Foundation
class MainViewController : UIViewController, UIDocumentPickerDelegate{
    let mainViewModel = MainViewModel()
    let productViewModel = ProductListViewModel()
    let basketDetailViewModel = BasketDetailViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        presentMainView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        Task{
            await productViewModel.getProductList()
            await basketDetailViewModel.getBasketDetail()
        }
    }
    
    private lazy var mainContentView : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private func presentMainView() {
        self.view.addSubview(mainContentView)
        mainContentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        mainContentView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        mainContentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        mainContentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        do {
            let mainViewSwiftUI = MainView(mainViewModel: self.mainViewModel, productListViewModel: self.productViewModel, basketDetailViewModel: self.basketDetailViewModel, onTapDetail: {product in
                
                let productDetailViewModel = ProductDetailViewModel()
                productDetailViewModel.detailProduct = product
                let productDetailViewController = ProductDetailViewController(productDetailViewModel: productDetailViewModel)
                self.navigationController?.pushViewController(productDetailViewController, animated: true)

                
            })
            let mainView = UIHostingController(rootView: mainViewSwiftUI)
            mainView.view.translatesAutoresizingMaskIntoConstraints = false
            mainContentView.addSubview(mainView.view)
            mainView.view.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor).isActive = true
            mainView.view.topAnchor.constraint(equalTo: mainContentView.topAnchor).isActive = true
            mainView.view.trailingAnchor.constraint(equalTo: mainContentView.trailingAnchor).isActive = true
            mainView.view.bottomAnchor.constraint(equalTo: mainContentView.bottomAnchor).isActive = true
            
        } catch {
            
        }
    }
}
