//
//  NetworkManager.swift
//  TestCasesDemo
//
//  Created by Shankar B S on 27/09/20.
//  Copyright © 2020 Slicode. All rights reserved.
//

import Foundation
enum NetworkError: Error {
    case badURL
    case dataError
    case parseError
}

class NetworkManager: PostNetworkDataManaging {
    func getPostItemsFrom(url: URL, completion: @escaping (Result<PostItems, NetworkError>) -> ()) {
        NetworkManager.getContentsFrom(url: url) { result in
            completion(result)
        }
    }
    
    static func getContentsFrom(url:URL, completion: @escaping (Result<PostItems, NetworkError>)->()) {
        
        let defaultSession = URLSession(configuration: .default)
        
        let dataTask = defaultSession.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                completion(.failure(NetworkError.dataError))
                return
            }
            do {
                let result = try JSONDecoder().decode(PostItems.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(NetworkError.parseError))
            }
        }
        dataTask.resume()
    }
}
