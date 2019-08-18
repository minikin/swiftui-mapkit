//
//  AllVehicles.swift
//  SwiftUIMapKit
//
//  Created by Sasha Prokhorenko on 18.08.19.
//  Copyright © 2019 Sasha Prokhorenko. All rights reserved.
//

import SwiftUI

struct VehiclesView: View {
    let vehicles: [Vehicle]
    @ObservedObject var store = sharedStore
    
    var body: some View {
        VStack {
            MapView(with: vehicles).edgesIgnoringSafeArea(.top)
        }
    }
}

//#if DEBUG
//struct AllVehicles_Previews: PreviewProvider {
//    static var previews: some View {
//        VehiclesView()
//    }
//}
//#endif
