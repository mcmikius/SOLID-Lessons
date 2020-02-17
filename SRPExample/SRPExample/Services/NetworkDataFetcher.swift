//
//  NetworkDataFetcher.swift
//  SRPExample
//
//  Created by Mykhailo Bondarenko on 17.02.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

import Foundation

class NetworkDataFetcher {
    var networkervice = NetworkService()
    init(networkService: NetworkService = NetworkService()) {
        self.networkervice = networkService
    }
    func fetchCountry(urlString: String, completion: @escaping ([Country]?) -> Void) {
        networkervice.request(urlString: urlString) { (data, error) in
               let decoder = JSONDecoder()
               guard let data = data else {return}
               let response = try? decoder.decode([Country].self, from: data)
               completion(response)
           }
       }
    func fetchFreeGames(urlString: String, completion: @escaping (AppGroup?) -> Void) {
     networkervice.request(urlString: urlString) { (data, error) in
            let decoder = JSONDecoder()
            guard let data = data else {return}
            let response = try? decoder.decode(AppGroup.self, from: data)
            completion(response)
        }
    }
    func fetchNewGames(urlString: String, completion: @escaping (AppGroup?) -> Void) {
     networkervice.request(urlString: urlString) { (data, error) in
            let decoder = JSONDecoder()
            guard let data = data else {return}
            let response = try? decoder.decode(AppGroup.self, from: data)
            completion(response)
        }
    }
}
