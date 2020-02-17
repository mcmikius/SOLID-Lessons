//
//  Networking.swift
//  SRPExample
//
//  Created by Mykhailo Bondarenko on 17.02.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

import Foundation

protocol Networking {
    
    func request(urlString: String, completion: @escaping (Data?, Error?) -> Void)
    
}
