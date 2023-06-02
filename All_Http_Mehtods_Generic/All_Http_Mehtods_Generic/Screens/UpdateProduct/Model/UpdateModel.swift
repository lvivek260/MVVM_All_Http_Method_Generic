//
//  UpdateModel.swift
//  All_Http_Mehtods_Generic
//
//  Created by Mac on 18/05/23.
//

import Foundation

struct UpdateProductModel: Codable{
    var id: Int?
    var title: String?
    var description: String?
    var price: Int?
    var discountPercentage: Double?
    var rating: Double?
    var stock: Int?
    var brand: String?
    var category:String?
    var thumbnail: String?
    var images: [String]?
    init() {}
}
        
