//
//  GetProductViewModel.swift
//  All_Http_Mehtods_Generic
//
//  Created by Mac on 18/05/23.
//

import Foundation

final class GetProductViewModel{
    var products: [Product] = []
    var eventHandler : ((_ event: Event) -> Void)?
    
    func fetchProduct(){
        DispatchQueue.main.async {
            self.eventHandler?(.startLoading)
        }
        APIManager.shared.callApi(
            model: GetProductModel.self,
            type: .getProduct
        ){ result in
            self.eventHandler?(.stopLoading)
            switch result{
            case .success(let products):
                self.products = products.products
                self.eventHandler?(.reloadData)
                break
                
            case .failure(let error):
                self.eventHandler?(.error(error))
                break
            }
        }
    }
}

