//
//  DeleteProductViewController.swift
//  All_Http_Mehtods_Generic
//
//  Created by Mac on 18/05/23.
//

import UIKit

class DeleteProductViewController: UIViewController {
    let viewModel = DeleteProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiConfiguration()
    }
    

}

extension DeleteProductViewController{
    func apiConfiguration(){
        updateProductData()
        observeEvent()
    }
    func updateProductData(){
        viewModel.deleteProduct(productId: 9)
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
