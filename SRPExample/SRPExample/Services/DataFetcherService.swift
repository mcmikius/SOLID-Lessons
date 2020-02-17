//
//  DataFetcherService.swift
//  SRPExample
//
//  Created by Mykhailo Bondarenko on 17.02.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

import Foundation

class DataFetcherService {
    
    var dataFetcher: DataFetcher
    init(dataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.dataFetcher = dataFetcher
    }
    
    func fetchCountry(completion: @escaping ([Country]?) -> Void) {
        let urlString = "https://raw.githubusercontent.com/Softex-Group/task-mobile/master/test.json"
        dataFetcher.fetchGenericJSONData(urlString: urlString, response: completion)
    }
    
    func fetchFreeGames(completion: @escaping (AppGroup?) -> Void) {
        let urlFreeGames = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/games/10/explicit.json"
        dataFetcher.fetchGenericJSONData(urlString: urlFreeGames, response: completion)
    }
    
    func fetchNewGames(completion: @escaping (AppGroup?) -> Void) {
        let urlNewGames = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-apps-we-love/all/10/explicit.json"
        dataFetcher.fetchGenericJSONData(urlString: urlNewGames, response: completion)
    }
}
