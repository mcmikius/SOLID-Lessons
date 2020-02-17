//
//  NetworkService.swift
//  SRPExample
//
//  Created by Mykhailo Bondarenko on 17.02.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

import Foundation

class NetworkService {
    
    func dataFetcher(urlString: String) {
        request(urlString: urlString) { (data, error) in
            let decoder = JSONDecoder()
            guard let data = data else {return}
            let response = try? decoder.decode([Country].self, from: data)
            print(response as Any)
        }
    }
    
    func request(urlString: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
            
        }
        task.resume()
    }
    
}