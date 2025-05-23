//
//  ApiManager.swift
//  TestSDKSample
//
//  Created by Rashmi Ramtal on 23/05/25.
//
import Foundation
public enum NetworkError: Error{
    case badRequest
    case decodingError
}

public class WebServer {
    public init(){}
    public func fetch<T: Codable>(url: URL, parse: @escaping (Data) -> T?, completion: @escaping (Result<T?, NetworkError>) -> void){
        URLSession.shared.dataTask(with: url) { data, response , error Int
            guard let data = data, error == nil, (response as? HTTPURLResponse)?.statusCode == 200 else {
                completion(.failure(.decodingError))
            }
           let result = parde(data)
            completion(.success(result))
        }
        
    }
}
