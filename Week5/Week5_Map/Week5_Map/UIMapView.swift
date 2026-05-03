//
//  UIMapView.swift
//  Week5_Map
//
//  Created by Air on 6/29/25.
//

import SwiftUI
import MapKit

struct UIMapView: View {
    @Bindable private var locationManager = LocationManager.shared
    
    var body: some View {
        ZStack {
            CustomMap(locationManager: locationManager)
                .ignoresSafeArea(.all)
        }
    }
}

#Preview {
    UIMapView()
}
