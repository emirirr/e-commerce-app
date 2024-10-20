//
//  ProductDetailViewController.swift
//  e-commerce-app
//
//  Created by İsmail Emir Tiryaki on 13.10.2024.
//

import Foundation
import UIKit
import SwiftUI

class ProductDetailViewController : UIViewController, UIDocumentPickerDelegate{
  
    var productDetailViewModel : ProductDetailViewModel?
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    init(productDetailViewModel : ProductDetailViewModel?) {
        super.init(nibName: nil, bundle: nil)
        self.productDetailViewModel = productDetailViewModel
        presentProductDetailView()
        Task{
            await productDetailViewModel?.getProductList()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private lazy var productDetailContentView : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func presentProductDetailView() {
        self.view.addSubview(productDetailContentView)
        productDetailContentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        productDetailContentView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        productDetailContentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        productDetailContentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        do {
            let productViewSwiftUI = ProductDetailView(onTapBack: {   self.navigationController?.popViewController(animated: true)}, onTapAddToCart:  {
                Task{
                    await self.productDetailViewModel?.setBasket()
                }
            }, onTapDeleteProduct: {
                Task{
                    await self.productDetailViewModel?.deleteProduct()
                }
            }, productDetailViewModel: self.productDetailViewModel!)
            let productDetailView = UIHostingController(rootView: productViewSwiftUI)
            productDetailView.view.translatesAutoresizingMaskIntoConstraints = false
            productDetailContentView.addSubview(productDetailView.view)
            productDetailView.view.leadingAnchor.constraint(equalTo: productDetailContentView.leadingAnchor).isActive = true
            productDetailView.view.topAnchor.constraint(equalTo: productDetailContentView.topAnchor).isActive = true
            productDetailView.view.trailingAnchor.constraint(equalTo: productDetailContentView.trailingAnchor).isActive = true
            productDetailView.view.bottomAnchor.constraint(equalTo: productDetailContentView.bottomAnchor).isActive = true
            
        } catch {
            
        }
    }
}
