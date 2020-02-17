//
//  DataFetcher.swift
//  SRPExample
//
//  Created by Mykhailo Bondarenko on 17.02.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

import Foundation

protocol DataFetcher {
    
    func fetchGenericJSONData<T: Decodable>(urlString: String, response: @escaping (T?) -> Void)
    
}
