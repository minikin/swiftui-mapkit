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
    // MARK: - Instance Properties

    let vehicles: [VehicleAnnotation]

    // MARK: - Initialization

    init(with vehicles: [VehicleResponse]) {
        self.vehicles = vehicles.map { VehicleAnnotation(with: $0) }
    }

    // MARK: - View LifeCycle

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ view: MKMapView, context _: Context) {
        view.addAnnotations(vehicles)
        view.showAnnotations(vehicles, animated: true)
    }

    // MARK: - Coordinator & MKMapViewDelegate

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    final class Coordinator: NSObject, MKMapViewDelegate {
        var mapView: MapView

        init(_ mapView: MapView) {
            self.mapView = mapView
        }

        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            if annotation is MKUserLocation { return nil }
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "pin")
            if annotationView == nil {
                annotationView = VehicleAnnotationView(annotation: annotation, reuseIdentifier: "pin")
                annotationView?.canShowCallout = false
            } else {
                annotationView?.annotation = annotation
            }
            annotationView?.image = UIImage(named: "Flag")
            return annotationView
        }

        func mapView(_: MKMapView, didDeselect view: MKAnnotationView) {
            if view.isKind(of: VehicleAnnotationView.self) {
                for subview in view.subviews {
                    subview.removeFromSuperview()
                }
            }
        }

        func mapView(_: MKMapView,
                     annotationView view: MKAnnotationView,
                     calloutAccessoryControlTapped _: UIControl) {
            let location = view.annotation as! VehicleAnnotation
            let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
            location.mapItem().openInMaps(launchOptions: launchOptions)
        }
    }
}
