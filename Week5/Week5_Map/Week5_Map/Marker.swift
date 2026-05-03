//
//  Marker.swift
//  Week5_Map
//
//  Created by Air on 6/28/25.
//

import Foundation
import MapKit

struct Marker: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    let title: String
}
