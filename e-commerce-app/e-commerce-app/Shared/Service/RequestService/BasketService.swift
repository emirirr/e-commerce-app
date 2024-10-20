//
//  BasketService.swift
//  e-commerce-app
//
//  Created by İsmail Emir Tiryaki on 13.10.2024.
//

import Foundation

import Foundation

class BasketService : ObservableObject{
    private let mw : Middleware = Middleware()
    
    public func getBasketList(getBasketListRequestModel: GetBasketListRequestModel) async -> BasketListModel? {
        
        let getBasketListRequest = GetBasketListRequest<BasketListModel>(GetBasketListRequestModel: getBasketListRequestModel)
        do {
            let getBasketListResponse = try await mw.send(request: getBasketListRequest)
            
            return getBasketListResponse
        }catch{
            
        }
        return nil
    }
    
    public func setBasketList(setBasketRequestModel: SetBasketRequestModel) async -> BasketListModel? {
        
        let setBasketRequest = SetBasketRequest<BasketListModel>(setBasketRequestModel: setBasketRequestModel)
        do {
            let setBasketResponse = try await mw.send(request: setBasketRequest)
            
            return setBasketResponse
        }catch{
            
        }
        return nil
    }
    
    public func deleteBasket(deleteBasketRequestModel: DeleteBasketRequestModel) async -> BasketListModel? {
        
        let deleteBasketRequest = DeleteBasketRequest<BasketListModel>(deleteBasketRequestModel: deleteBasketRequestModel)
        do {
            let deleteBasketResponse = try await mw.send(request: deleteBasketRequest)
            
            return deleteBasketResponse
        }catch{
            
        }
        return nil
    }
}
