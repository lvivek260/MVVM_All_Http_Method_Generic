//
//  UpdateProductViewController.swift
//  All_Http_Mehtods_Generic
//
//  Created by Mac on 18/05/23.
//

import UIKit

class UpdateProductViewController: UIViewController {
    let viewModel = UpdateProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiConfiguration()
    }
    
}

extension UpdateProductViewController{
    func apiConfiguration(){
        updateProductData()
        observeEvent()
    }
    func updateProductData(){
        var product = UpdateProductModel()
        product.title = "Vivek Lokhande Product"
        viewModel.addProduct(product: product, productId: 8)
    }
    func observeEvent(){
        viewModel.eventHandler = { [weak self] event in
            guard let self = self else { return }
            switch event{
            case .startLoading:
                print(event)
                break
                
            case .stopLoading:
                print(event)
                break
                
            case .reloadData:
                print(event)
                print(self.viewModel.product as Any)
                break
                
            case .error(let err):
                print(err)
                break
            }
        }
    }
}
