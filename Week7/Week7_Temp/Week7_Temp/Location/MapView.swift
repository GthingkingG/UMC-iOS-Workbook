//
//  MapView.swift
//  Week7_Temp
//
//  Created by Air on 8/5/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    @Bindable private var locationManager = LocationManager.shared
    @State private var viewModel: MapViewModel = .init()
    @State private var searchText = ""
    
    @State private var lastKnownLocation: CLLocationCoordinate2D?
    @State private var showSearchButton: Bool = false
    
    @Namespace var mapScope
    
    @State private var showEnteredAlert: Bool = false
    @State private var showExitedAlert: Bool = false
    
    var body: some View {
        VStack {
            TextField("장소를 검색하세요", text: $searchText, onCommit: {
                if let location = locationManager.currentLocation {
                    viewModel.search(query: searchText, to: location)
                }
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            
            Map(position: $viewModel.cameraPosition, bounds: .none, interactionModes: .all, content: {
                ForEach(viewModel.searchResults, id: \.id, content: { place in
                    if let coordinate = place.mapItem.placemark.location?.coordinate {
                        Annotation(place.mapItem.name ?? "이름없음", coordinate: coordinate, content: {
                            Image(systemName: "mappin")
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .foregroundStyle(Color.red)
                        })
                    }
                })
            })
            .frame(height: 300)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()

            List(viewModel.searchResults) { place in
                VStack(alignment: .leading) {
                    Text(place.mapItem.name ?? "이름 없음")
                        .font(.headline)
                    Text(place.mapItem.placemark.title ?? "")
                        .font(.subheadline)
                        .foregroundStyle(Color.gray)
                }
            }
            .border(Color.red)
        }
        
//        
//        ZStack(alignment: .bottomTrailing) {
//            Map(position: $viewModel.cameraPosition, scope: mapScope) {
//                ForEach(viewModel.markers, id: \.id, content: { marker in
//                    Annotation(marker.title, coordinate: marker.coordinate, content: {
//                        Image(systemName: "mappin.circle.fill")
//                            .renderingMode(.template)
//                            .resizable()
//                            .frame(width: 30, height: 30)
//                            .foregroundStyle(Color.red)
//                    })
//                })
//                
//                UserAnnotation(anchor: .center)
//                
//                MapCircle(center: viewModel.geefenceCoordinate, radius: viewModel.geofenceRadius)
//                    .foregroundStyle(Color.blue.opacity(0.2))
//                    .stroke(Color.blue, lineWidth: 2)
//
//            }
//            .onChange(of: locationManager.didEnterGeofence) { _, entered in
//                if entered {
//                    showEnteredAlert = true
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//                        showEnteredAlert = false
//                        locationManager.didEnterGeofence = false
//                    }
//                }
//            }
//            .onChange(of: locationManager.didExitGeofence) { _, exited in
//                if exited {
//                    showExitedAlert = true
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//                        showExitedAlert = false
//                        locationManager.didExitGeofence = false
//                    }
//                }
//            }
//            
//            MapUserLocationButton(scope: mapScope)
//                .overlay(content: {
//                    RoundedRectangle(cornerRadius: 5)
//                        .fill(Color.clear)
//                        .stroke(Color.red, style: .init(lineWidth: 2))
//                })
//                .offset(x: -10, y: -10)
//            
//            if showEnteredAlert {
//                HStack {
//                    Spacer()
//                    Text("\(viewModel.geofenceIdentifier) 진입함")
//                        .padding()
//                        .background(.ultraThinMaterial)
//                        .clipShape(RoundedRectangle(cornerRadius: 10))
//                        .shadow(radius: 5)
//                    Spacer()
//                }
//            }
//            
//            if showExitedAlert {
//                HStack {
//                    Spacer()
//                    Text("\(viewModel.geofenceIdentifier) 벗어남")
//                        .padding()
//                        .background(.ultraThinMaterial)
//                        .clipShape(RoundedRectangle(cornerRadius: 10))
//                        .shadow(radius: 5)
//                    Spacer()
//                }
//            }
//        }
//        .mapScope(mapScope)
    }
}

#Preview {
    MapView()
}
