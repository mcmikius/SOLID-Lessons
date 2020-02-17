//
//  DataStore.swift
//  SRPExample
//
//  Created by Mykhailo Bondarenko on 17.02.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

import Foundation

class DataStore {
    
    func saveNameInCache(name: String) {
        print("Your name: \(name) is saved")
    }
     
    func getNameFromCache() -> String {
        return "some name"
    }
}
