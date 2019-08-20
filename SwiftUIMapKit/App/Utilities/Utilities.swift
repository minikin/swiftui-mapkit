//
//  Utilities.swift
//  SwiftUIMapKit
//
//  Created by Sasha Prokhorenko on 19.08.19.
//  Copyright © 2019 Sasha Prokhorenko. All rights reserved.
//

import Foundation
import SwiftUIMapKitServices

let sampleVehicleResponse: [VehicleResponse] = loadLocalJson(name: "vehicles")

func loadLocalJson<A: Codable>(name: String) -> A {
    let url = Bundle.main.url(forResource: name, withExtension: "json")!
    let data = try! Data(contentsOf: url)
    return try! decoder.decode(A.self, from: data)
}
