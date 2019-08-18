//
//  API.swift
//  SwiftUIMapKit
//
//  Created by Sasha Prokhorenko on 18.08.19.
//  Copyright © 2019 Sasha Prokhorenko. All rights reserved.
//

import Foundation

struct API {
    var baseURL: URL
    
    init(baseURL: URL = URL(string: "https://my-json-server.typicode.com/FlashScooters/Challenge")!) {
        self.baseURL = baseURL
    }
    
    var vehicles: Endpoint<[Vehicle]> {
        return Endpoint(json: .get, url: baseURL.appendingPathComponent("vehicles"), decoder: decoder)
    }
}
