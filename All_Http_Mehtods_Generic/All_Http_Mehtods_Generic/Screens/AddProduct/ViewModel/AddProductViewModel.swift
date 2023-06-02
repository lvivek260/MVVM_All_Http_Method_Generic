//
//  AddProductViewModel.swift
//  All_Http_Mehtods_Generic
//
//  Created by Mac on 18/05/23.
//

import Foundation

final class AddProductViewModel{
    var product: AddProductResponse?
    var eventHandler : ((_ event: Event) -> Void)?
    
    func addProduct(product: AddProduct){
        DispatchQueue.main.async {
            self.eventHandler?(.startLoading)
        }
        APIManager.shared.callApi(
            model: AddProductResponse.self,
            type: .addProduct(product: product)
        ){ result in
            self.eventHandler?(.stopLoading)
            switch result{
            case .success(let product):
                self.product = product
                self.eventHandler?(.reloadData)
                break
                
            case .failure(let error):
                self.eventHandler?(.error(error))
                break
            }
            
        }
    }
}

