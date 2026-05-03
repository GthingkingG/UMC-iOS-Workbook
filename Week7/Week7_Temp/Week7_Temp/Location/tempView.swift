//
//  tempView.swift
//  Week7_Temp
//
//  Created by Air on 8/5/25.
//

import SwiftUI
import CoreLocation
import MapKit

struct tempView: View {
    @State var mapViewModel: MapViewModel = .init()
    @Bindable private var locationManager = LocationManager.shared
    let geocoder = CLGeocoder()
    @State private var addressString: String = "포항시 지곡동"
    
    var body: some View {
        VStack(spacing: 60) {
            Text("지오코딩 - 역지오코딩")
            TextField("주소", text: $addressString)
            
            Button(action: {
                Task {
                    do {
                        let placemarks = try await geocoder.geocodeAddressString(addressString)
                        if let location = placemarks.first?.location {
                            print("위도: \(location.coordinate.latitude), 경도: \(location.coordinate.longitude)")
                        }
                    } catch {
                        print("지오코딩 에러: \(error.localizedDescription)")
                    }
                }
            }, label: {
                Text("지오코딩")
            })
            
            Button(action: {
                Task {
                    guard let location = locationManager.currentLocation else {
                        print("현재 위치 오류")
                        return
                    }
                    
                    do {
                        let placemarks = try await geocoder.reverseGeocodeLocation(location)
                        if let placemark = placemarks.first {
                            let address = [
                                placemark.administrativeArea,
                                placemark.locality,
                                placemark.subLocality,
                                placemark.subThoroughfare
                            ].compactMap { $0 }.joined(separator: " ")
                            
                            print("주소: \(address)")
                        }
                    } catch {
                        print("역지오코딩 에러: \(error.localizedDescription)")
                    }
                }
            }, label: {
                Text("역지오코딩")
            })
        }
    }
}

#Preview {
    tempView()
}
