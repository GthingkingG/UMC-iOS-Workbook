//
//  MapViewModel.swift
//  Week7_Temp
//
//  Created by Air on 8/5/25.
//

import SwiftUI
import MapKit
import Observation

@Observable
final class MapViewModel {
    var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    var currentMapCenter: CLLocationCoordinate2D?
    
    var searchResults: [Place] = []
    
    var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.5665, longitude: 126.9780), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    var markers: [Marker] = [
        .init(coordinate: .init(latitude: 37.504675, longitude: 126.957034), title: "중앙대학교"),
        .init(coordinate: .init(latitude: 37.529598, longitude: 126.963946), title: "용산 CGV")
    ]
    
    let geefenceCoordinate = CLLocationCoordinate2D(latitude: 36.013024, longitude: 129.326010)
    let geofenceRadius: CLLocationDistance = 200
    let geofenceIdentifier = "포항공대"
    
    init() {
        LocationManager.shared.startMonitoringGeofence(center: geefenceCoordinate, radius: geofenceRadius, identifier: geofenceIdentifier)
    }
    
    func search(query: String, to location: CLLocation) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        request.region = .init(center: location.coordinate, span: .init(latitudeDelta: 0.05, longitudeDelta: 0.05))
        
        let search = MKLocalSearch(request: request)
        search.start { [weak self] response, error in
            guard let self, let mapItems = response?.mapItems else { return }
            
            DispatchQueue.main.async {
                self.searchResults = mapItems.map { Place(mapItem: $0) }
            }
        }
    }
    
    // MARK: - Update Methods
    /// - Parameter coordinate: 이동할 좌표
    func updateCamera(to coordinate: CLLocationCoordinate2D) {
        cameraPosition = .region(
            MKCoordinateRegion(
                center: coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            )
        )
    }
    /// - Parameter location: 현재 위치 정보
    func updateFromLocation(_ location: CLLocation?) {
        guard let coordinate = location?.coordinate else { return }
        updateCamera(to: coordinate)
    }
}
