//
//  ContentView.swift
//  Week7_Temp
//
//  Created by Air on 8/4/25.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State var contentsViewModel = ContentsViewModel()
    private var locationManager = LocationManager()
    
    
    var body: some View {
        VStack(spacing: 40) {
            Button(action: {
                contentsViewModel.getRouteData(departure: "126.9784,37.5666", arrival: "127.0276,37.4979")
            }, label: {
                Text("경로 불러오기")
            })
            
            Button(action: {
                contentsViewModel.getListData(query: "포항 스타벅스")
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
                    contentsViewModel.printList()
                }
            }, label: {
                Text("리스트 불러오기")
            })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

