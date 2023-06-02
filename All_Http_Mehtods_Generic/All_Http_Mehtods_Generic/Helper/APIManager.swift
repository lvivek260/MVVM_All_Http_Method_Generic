//
//  APIManager.swift
//  All_Http_Mehtods_Generic
//
//  Created by Mac on 17/05/23.
//

import Foundation

enum FetchingError: Error{
    case invalidUrl
    case invalidData
    case invalidResponse
    case DecodingError(Error)
}

enum Event{
    case startLoading
    case stopLoading
    case reloadData
    case error(FetchingError)
}

typealias Handler<T> = (Result<T, FetchingError>)->Void

final class APIManager{
    static let shared = APIManager()
    private init(){}
    let commonHeader = ["Content-Type": "application/json"]
    
    
    func callApi<T: Decodable>(
        model: T.Type,
        type: endPointItems,
        completion: @escaping Handler<T>
    ){
        guard let url = type.url else{
            completion(.failure(.invalidUrl))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = type.httpMehod.rawValue
        if let body = type.parameter{
            request.httpBody = body
            request.allHTTPHeaderFields = type.header
        }
        
        URLSession.shared.dataTask(with: request){ data,response,error in
            guard let data = data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            guard let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            do{
                let fetchedData = try JSONDecoder().decode(model, from: data)
                completion(.success(fetchedData))
            }
            catch let err{
                completion(.failure(.DecodingError(err)))
            }
        }.resume()
    }
}


