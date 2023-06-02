//
//  EndPointItems.swift
//  All_Http_Mehtods_Generic
//
//  Created by Mac on 17/05/23.
//

import Foundation

enum HttpMethod: String{
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
}

protocol EndPointType{
    var baseURL: String { get }
    var path: String { get }
    var url: URL? { get }
    var httpMehod: HttpMethod { get }
    var parameter: Data? { get }
    var header: [String: String]? { get }
}

enum endPointItems{
    case getProduct
    case addProduct(product: AddProduct)
    case updateProduct(product: UpdateProductModel, productId: String)
    case deleteProduct(productId: String)
}

extension endPointItems: EndPointType{
    var baseURL: String {
       return "https://dummyjson.com/"
    }
    
    var path: String {
        switch self{
        case .getProduct:
            return "products"
        case .addProduct:
            return "products/add"
        case .updateProduct(product: _, productId: let productId):
            return "products/\(productId)"
        case .deleteProduct(productId: let productId):
            return "products/\(productId)"
        }
    }
    
    var url: URL? {
        return URL(string: "\(baseURL)\(path)")
    }
    
    var httpMehod: HttpMethod {
        switch self {
        case .getProduct:
            return .get
        case .addProduct:
            return .post
        case .updateProduct:
            return .put
        case .deleteProduct:
            return .delete
        }
    }
    
    var parameter: Data? {
        switch self{
        case .getProduct:
            return Data()
        case .addProduct(product: let product):
            return try? JSONEncoder().encode(product)
        case .updateProduct(product: let product, productId: _):
            return try? JSONEncoder().encode(product)
        case .deleteProduct:
            return Data()
        }
    }
    
    var header: [String : String]? {
        return APIManager.shared.commonHeader
    }
}

