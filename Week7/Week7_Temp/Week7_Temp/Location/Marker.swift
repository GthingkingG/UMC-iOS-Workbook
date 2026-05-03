//
//  Marker.swift
//  Week7_Temp
//
//  Created by Air on 8/5/25.
//

import Foundation
import MapKit

struct Marker: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    let title: String
}
