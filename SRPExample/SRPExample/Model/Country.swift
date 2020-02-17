//
//  Country.swift
//  SRPExample
//
//  Created by Mykhailo Bondarenko on 17.02.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

import Foundation

struct Country: Decodable {
    var id: String
    var time: String
    var name: String
    var image: String?
}
