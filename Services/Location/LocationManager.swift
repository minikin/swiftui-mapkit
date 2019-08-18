//
//  LocationManager.swift
//  SwiftUIMapKit
//
//  Created by Sasha Prokhorenko on 18.08.19.
//  Copyright © 2019 Sasha Prokhorenko. All rights reserved.
//

import MapKit

struct LocationManager {
    private let locationManager = CLLocationManager()

    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() != .authorizedAlways {
            locationManager.requestAlwaysAuthorization()
        }
    }
}
