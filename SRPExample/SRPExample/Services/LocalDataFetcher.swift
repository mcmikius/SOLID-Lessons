//
//  LocalDataFetcher.swift
//  SRPExample
//
//  Created by Mykhailo Bondarenko on 17.02.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

import Foundation

class LocalDataFetcher: NetworkDataFetcher {
    
    override func fetchGenericJSONData<T>(urlString: String, response: @escaping (T?) -> Void) where T : Decodable {
        guard let file = Bundle.main.url(forResource: urlString, withExtension: nil) else {
            print("Couldn't find \(urlString) is main bundle")
            response(nil)
            return
        }
        
        let data = try? Data(contentsOf: file)
        let decoded = self.decodeJSON(type: T.self, from: data)
        response(decoded)
    }
}
