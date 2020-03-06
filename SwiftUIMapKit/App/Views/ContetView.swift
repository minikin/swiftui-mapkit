//
//  ContetView.swift
//  SwiftUIMapKit
//
//  Created by Sasha Prokhorenko on 19.08.19.
//  Copyright © 2019 Sasha Prokhorenko. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store = sharedStore
    var body: some View {
        Group {
            if !store.loaded {
                Text("Loading...")
            } else {
                NavigationView { VehiclesView(vehicles: store.vehicles) }
            }
        }
    }
}

#if DEBUG
    struct ContetView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
#endif
