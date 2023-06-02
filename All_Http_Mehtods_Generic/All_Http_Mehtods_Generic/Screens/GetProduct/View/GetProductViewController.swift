//
//  GetProductViewController.swift
//  All_Http_Mehtods_Generic
//
//  Created by Mac on 18/05/23.
//

import UIKit

class GetProductViewController: UIViewController {

    let viewModel = GetProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiConfiguration()
    }
}

extension GetProductViewController{
    func apiConfiguration(){
        fetchData()
        observeEvent()
    }
    func fetchData(){
        viewModel.fetchProduct()
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
                print(self.viewModel.products)
                break
                
            case .error(let err):
                print(err)
                break
            }
        }
    }
}
