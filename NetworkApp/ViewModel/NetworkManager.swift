//
//  NetworkManager.swift
//  NetworkApp
//
//  Created by Nigar on 03.04.23.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    
    let baseURL = "https://jsonplaceholder.typicode.com/"
    
    func request(path: String,
                 method: HTTPMethod = .get,
                 parameters: Parameters? = nil,
                 encoding: ParameterEncoding = URLEncoding.default,
                 headers: HTTPHeaders? = nil,
                 complete: @escaping ((Data?, String?)->())) {
        AF.request("\(baseURL)\(path)",
                   method: method,
                   parameters: parameters,
                   encoding: encoding,
                   headers: headers).responseData { response in
            switch response.result {
            case .success(let data):
                complete(data, nil)
            case .failure(let error):
                complete(nil, error.localizedDescription)
            }
        }
    }
    
    func request<T:Codable>(model: T.Type,
                            path: String,
                            method: HTTPMethod = .get,
                            parameters: Parameters? = nil,
                            encoding: ParameterEncoding = URLEncoding.default,
                            headers: HTTPHeaders? = nil,
                            complete: @escaping ((T?, String?)->())) {
        AF.request("\(baseURL)\(path)",
                   method: method,
                   parameters: parameters,
                   encoding: encoding,
                   headers: headers).responseData { responseData in
            do {
                let item = try JSONDecoder().decode(T.self, from: responseData.data ?? Data())
                complete(item, nil)
            } catch {
                complete(nil, error.localizedDescription)
            }
        }
    }
}
