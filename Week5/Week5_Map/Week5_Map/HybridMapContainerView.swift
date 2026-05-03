//
//  HybridMapContainerView.swift
//  Week5_Map
//
//  Created by Air on 6/29/25.
//

import SwiftUI
import MapKit

struct HybridMapContainerView: View {
    @State private var selectedCoordinate: CLLocationCoordinate2D? = nil
    @State private var cameraCenter: CLLocationCoordinate2D? = nil
    
    var body: some View {
        ZStack(alignment: .top) {
            HybridMapView(selectedCoordinate: $selectedCoordinate, cameraCenter: $cameraCenter)
                .ignoresSafeArea()
            
            VStack(spacing: 12) {
                if let center = cameraCenter {
                    Button(action: {
                        print("여기서 다시 검색 - 중심 좌표: \(center.latitude), \(center.longitude)")
                    }, label: {
                        Text("🔍 여기서 다시 검색")
                            .padding()
                            .background(.thinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    })
                }
                
                if let pin = selectedCoordinate {
                    Text("📌 선택된 위치: \(pin.latitude), \(pin.longitude)")
                        .font(.caption)
                        .padding(6)
                        .background(.ultraThinMaterial)
                        .clipShape(Capsule())
                }
            }
            .padding(.top, 60)
        }
    }
}

#Preview {
    HybridMapContainerView()
}
