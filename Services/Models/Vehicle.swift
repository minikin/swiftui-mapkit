//
//  VehicleLocation.swift
//  SwiftUIMapKit
//
//  Created by Sasha Prokhorenko on 18.08.19.
//  Copyright © 2019 Sasha Prokhorenko. All rights reserved.
//

import Foundation

struct Vehicle: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let latitude: Double
    let longitude: Double
    let batteryLevel: Double
    let timestamp: String
    let price: Double
    let priceTime: Double
    let currency: String
}
