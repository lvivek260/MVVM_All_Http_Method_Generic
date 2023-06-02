//
//  DeleteProductViewModel.swift
//  All_Http_Mehtods_Generic
//
//  Created by Mac on 18/05/23.
//

import Foundation

final class DeleteProductViewModel{
    var product: DeleteProductModel?
    var eventHandler : ((_ event: Event) -> Void)?
    
    func deleteProduct(productId: Int){
        DispatchQueue.main.async {
            self.eventHandler?(.startLoading)
        }
        APIManager.shared.callApi(
            model: DeleteProductModel.self,
            type: .deleteProduct(productId: "\(productId)")
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

