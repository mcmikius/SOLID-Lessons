//
//  Feed.swift
//  SRPExample
//
//  Created by Mykhailo Bondarenko on 17.02.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

import Foundation

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}
