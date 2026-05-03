//
//  CustomMap.swift
//  Week5_Map
//
//  Created by Air on 6/29/25.
//

import SwiftUI
import MapKit

struct CustomMap: UIViewRepresentable {
    let mapView = MKMapView()
    
    @Bindable var locationManager: LocationManager
    
    func makeUIView(context: Context) -> MKMapView {
        mapView.delegate = context.coordinator
        
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .followWithHeading
        mapView.isRotateEnabled = false
        mapView.setUserTrackingMode(.followWithHeading, animated: true)
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        print("업데이트함")
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator: NSObject, CLLocationManagerDelegate, MKMapViewDelegate {
        
    }
}
