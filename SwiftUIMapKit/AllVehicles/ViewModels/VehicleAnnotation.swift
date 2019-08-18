//
//  VehicleAnnotation.swift
//  SwiftUIMapKit
//
//  Created by Sasha Prokhorenko on 18.08.19.
//  Copyright © 2019 Sasha Prokhorenko. All rights reserved.
//

import Foundation
import MapKit

final class VehicleAnnotation: NSObject, MKAnnotation {
    let vehicle: VehicleResponse

    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: vehicle.latitude, longitude: vehicle.longitude)
    }

    init(with vehicle: VehicleResponse) {
        self.vehicle = vehicle
    }

    func mapItem() -> MKMapItem {
        let placemark = MKPlacemark(coordinate: coordinate)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = vehicle.name
        return mapItem
    }
}
