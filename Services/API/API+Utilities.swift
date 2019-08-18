//
//  API+Utilities.swift
//  SwiftUIMapKit
//
//  Created by Sasha Prokhorenko on 18.08.19.
//  Copyright © 2019 Sasha Prokhorenko. All rights reserved.
//

import Foundation

let encoder: JSONEncoder = {
    let enc = JSONEncoder()
    enc.dateEncodingStrategy = .iso8601
    return enc
}()

let decoder: JSONDecoder = {
    let dec = JSONDecoder()
    dec.dateDecodingStrategy = .iso8601
    return dec
}()
