//
//  VehicleAnnotationView.swift
//  SwiftUIMapKit
//
//  Created by Sasha Prokhorenko on 18.08.19.
//  Copyright © 2019 Sasha Prokhorenko. All rights reserved.
//

import MapKit

final class VehicleAnnotationView: MKAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            guard let vehicleAnnotation = newValue as? VehicleAnnotation else { return }

            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            let mapsButton = UIButton(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 30, height: 30)))
            rightCalloutAccessoryView = mapsButton

            let detailLabel = UILabel()
            detailLabel.numberOfLines = 0
            detailLabel.font = detailLabel.font.withSize(12)
            detailLabel.text = vehicleAnnotation.vehicle.description
            detailCalloutAccessoryView = detailLabel
        }
    }
}
