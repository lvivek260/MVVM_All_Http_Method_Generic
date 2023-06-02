//
//  GetProductModel.swift
//  All_Http_Mehtods_Generic
//
//  Created by Mac on 18/05/23.
//

import Foundation

struct GetProductModel: Decodable{
    let products: [Product]
}

struct Product: Decodable{
    let id: Int
    let title: String
    let description: String
    let price: Int
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let brand: String
    let category: String
    let thumbnail: String
    let images: [String]
}
