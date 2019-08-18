//
//  MapView.swift
//  SwiftUIMapKit
//
//  Created by Sasha Prokhorenko on 18.08.19.
//  Copyright © 2019 Sasha Prokhorenko. All rights reserved.
//

import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
    let vehicles: [VehicleResponse]

    init(with vehicles: [VehicleResponse]) {
        self.vehicles = vehicles
    }

    func makeUIView(context _: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ view: MKMapView, context _: Context) {
        print("vehicles", vehicles)

        guard let item = vehicles.first else { return }
        let coordinate = CLLocationCoordinate2D(latitude: item.latitude, longitude: item.longitude)
        let place = MKPlacemark(coordinate: coordinate)

        view.addAnnotation(place)

        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
    }
}

// #if DEBUG
// struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView()
//    }
// }
// #endif
