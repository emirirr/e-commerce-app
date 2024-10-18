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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    init() {
            super.init(nibName: nil, bundle: nil)
            presentMainView()
        let productService = ProductService()
        Task{
            let repsonse = await productService.getInvoicesList()

            print(repsonse?.urunler?[0].ad ?? "Valahi gelmedi")
        }
        }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
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
            let mainViewSwiftUI = MainView()
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
