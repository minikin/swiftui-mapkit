//
//  VehicleAnnotation.swift
//  SwiftUIMapKit
//
//  Created by Sasha Prokhorenko on 18.08.19.
//  Copyright © 2019 Sasha Prokhorenko. All rights reserved.
//

import Foundation
import MapKit
import SwiftUIMapKitServices

final class VehicleAnnotation: NSObject, MKAnnotation {
    // MARK: - Instance Properties

    let vehicle: VehicleResponse

    var title: String? {
        vehicle.description
    }

    var subtitle: String? {
        vehicle.id.description
    }

    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: vehicle.latitude, longitude: vehicle.longitude)
    }

    // MARK: - Initialization

    init(with vehicle: VehicleResponse) {
        self.vehicle = vehicle
    }
}

// MARK: - Helpers

extension VehicleAnnotation {
    /// Annotation right callout accessory opens this mapItem in Maps
    func mapItem() -> MKMapItem {
        let placemark = MKPlacemark(coordinate: coordinate)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = vehicle.description
        return mapItem
    }
}

extension VehicleAnnotation {
    func vehicleDescription() -> String {
        """
        Id: \(vehicle.id) \n
        Name: \(vehicle.name) \n
        Description: \(vehicle.description) \n
        Price: \(vehicle.price) \(vehicle.currency) \n
        """
    }
}
