//
//  AddProduct.swift
//  All_Http_Mehtods_Generic
//
//  Created by Mac on 18/05/23.
//

import Foundation

struct AddProduct: Encodable{
    let title: String
}

struct AddProductResponse: Decodable{
    let id: Int
    let title: String
}
