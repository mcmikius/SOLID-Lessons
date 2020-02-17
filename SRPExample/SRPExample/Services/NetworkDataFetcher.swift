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
     func dataFetcher(urlString: String) {
        networkervice.request(urlString: urlString) { (data, error) in
               let decoder = JSONDecoder()
               guard let data = data else {return}
               let response = try? decoder.decode([Country].self, from: data)
               print(response)
           }
       }
}
