//
//  ProductDetailViewModel.swift
//  e-commerce-app
//
//  Created by İsmail Emir Tiryaki on 13.10.2024.
//

import Foundation
class ProductDetailViewModel: ObservableObject {
  
    let productService = ProductService()
    let basketService = BasketService()
    
    @Published public var productList: ProductListModel?
    @Published public var detailProduct: ProductModel? {
           didSet {
               productDidChange()
           }
       }
    @Published public var isBasketAdedd : Bool = false
    @Published public var productCount : Int = 0

    func getProductList() async {
        let response = await productService.getProductList()
        productList = response
    }
    
    func setBasket() async {
        let setBasketRequestModel = SetBasketRequestModel()
        setBasketRequestModel.ad = detailProduct?.ad ?? ""
        setBasketRequestModel.fiyat = detailProduct?.fiyat ?? 0
        setBasketRequestModel.kategori = detailProduct?.kategori ?? ""
        setBasketRequestModel.kullaniciAdi = ServicePaths.Constans.userName
        setBasketRequestModel.marka = detailProduct?.marka ?? ""
        setBasketRequestModel.resim = detailProduct?.resim ?? ""
        setBasketRequestModel.siparisAdeti = 1
       
        await basketService.setBasketList(setBasketRequestModel: setBasketRequestModel)
        await getBasketList()
    }
    
    func getBasketList() async {
        
        let getBasketListRequestModel = GetBasketListRequestModel()
        getBasketListRequestModel.kullaniciAdi = ServicePaths.Constans.userName
        let baskets = await basketService.getBasketList(getBasketListRequestModel : getBasketListRequestModel)
        
        var count = 0
        baskets?.urunlerSepeti.forEach { urun in
            if urun.ad == detailProduct?.ad {
                count += 1
            }
        }
        productCount = count
        
        if productCount > 0 {
            isBasketAdedd = true
        }
        else{
            isBasketAdedd = false
        }
    }
    private func productDidChange() {
           Task {
               await getBasketList()
           }
    }
    
    func deleteProduct() async {
        let deleteBasketRequestModel = DeleteBasketRequestModel()
        deleteBasketRequestModel.kullaniciAdi = ServicePaths.Constans.userName
       
        
        let getBasketListRequestModel = GetBasketListRequestModel()
        getBasketListRequestModel.kullaniciAdi = ServicePaths.Constans.userName
        let baskets = await basketService.getBasketList(getBasketListRequestModel : getBasketListRequestModel)
        
        baskets?.urunlerSepeti.forEach { urun in
            if urun.ad == detailProduct?.ad {
                deleteBasketRequestModel.sepetId = urun.sepetId
            }
        }
        await basketService.deleteBasket(deleteBasketRequestModel: deleteBasketRequestModel)
        await getBasketList()
    }
}
