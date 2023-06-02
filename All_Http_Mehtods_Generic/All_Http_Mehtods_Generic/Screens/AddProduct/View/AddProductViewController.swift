//
//  AddProductViewController.swift
//  All_Http_Mehtods_Generic
//
//  Created by Mac on 18/05/23.
//

import UIKit

class AddProductViewController: UIViewController {
    let viewModel = AddProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiConfiguration()
    }
}

extension AddProductViewController{
    func apiConfiguration(){
        fetchData()
        observeEvent()
    }
    func fetchData(){
        let product = AddProduct(title: "Vivek Product")
        viewModel.addProduct(product: product)
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
