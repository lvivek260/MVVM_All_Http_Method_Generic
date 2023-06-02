//
//  UpdateProductViewModel.swift
//  All_Http_Mehtods_Generic
//
//  Created by Mac on 18/05/23.
//

import Foundation

final class UpdateProductViewModel{
    var product: UpdateProductModel?
    var eventHandler : ((_ event: Event) -> Void)?
    
    func addProduct(product: UpdateProductModel, productId: Int){
        DispatchQueue.main.async {
            self.eventHandler?(.startLoading)
        }
        APIManager.shared.callApi(
            model: UpdateProductModel.self,
            type: .updateProduct(product: product, productId: "\(productId)")
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

