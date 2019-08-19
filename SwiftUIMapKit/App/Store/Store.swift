//
//  Store.swift
//  SwiftUIMapKit
//
//  Created by Sasha Prokhorenko on 18.08.19.
//  Copyright © 2019 Sasha Prokhorenko. All rights reserved.
//

import Combine
import SwiftUI

let sharedStore = Store()

final class Store: ObservableObject {
    // MARK: - Instance Properties
    
    let objectWillChange: AnyPublisher<Void, Never>
    let sharedVehicles = Resource(endpoint: Current.api.vehicles)
    
    var loaded: Bool {
        sharedVehicles.value != nil
    }

    var vehicles: [VehicleResponse] { sharedVehicles.value ?? [] }

    // MARK: - Initialization
    
    init() {
        objectWillChange = sharedVehicles.objectWillChange.zip(sharedVehicles.objectWillChange).map { _ in () }.eraseToAnyPublisher()
    }
}
