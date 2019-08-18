//
//  Store.swift
//  SwiftUIMapKit
//
//  Created by Sasha Prokhorenko on 18.08.19.
//  Copyright © 2019 Sasha Prokhorenko. All rights reserved.
//

import SwiftUI
import Combine

let sharedStore = Store()

final class Store: ObservableObject {
    let objectWillChange: AnyPublisher<(), Never>
    let sharedVehicles = Resource(endpoint: Current.api.vehicles)
    
    init() {
        objectWillChange = sharedVehicles.objectWillChange.zip(sharedVehicles.objectWillChange).map { _ in () }.eraseToAnyPublisher()
    }
    
    var loaded: Bool {
        sharedVehicles.value != nil
    }
    
    var vehicles: [Vehicle] { sharedVehicles.value ?? [] }
}
