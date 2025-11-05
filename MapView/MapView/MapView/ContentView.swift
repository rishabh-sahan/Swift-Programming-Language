//
//  ContentView.swift
//  MapView
//
//  Created by BATCH03L1 on 09/10/25.
//

import SwiftUI
import MapKit
struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct ContentView: View {
    var locations: [Location] = [
        .init(name: "Mysore", coordinate: .init(latitude: 12.2958, longitude: 76.6394)),
        .init(name: "Bengaluru", coordinate: .init(latitude: 12.9716, longitude: 77.5946)),
        .init(name: "Hyderabad", coordinate: .init(latitude: 13.0827, longitude: 80.2707)),
        .init(name: "Chennai", coordinate: .init(latitude: 17.3850, longitude: 78.4867)),
        .init(name: "Pune", coordinate: .init(latitude: 18.5204, longitude: 73.8567)),
        .init(name: "Mandya", coordinate: .init(latitude: 12.5218, longitude: 76.8951)),

    ]
    @State private var region: MKCoordinateRegion = .init(center: .init(latitude: 12.5175308, longitude: 76.8786333), span: .init(latitudeDelta: 4, longitudeDelta: 4))
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations) { location in MapAnnotation(coordinate: location.coordinate) {
            VStack {
                if location.name == "Bengaluru" {
                    Image(systemName: "house")
                        .font(.title)
                        .foregroundColor(.black)
                } else {
                    Image(systemName: "mappin.circle.fill")
                        .font(.title)
                        .foregroundColor(.red)
                }
            }
        }
        }
    }
}

#Preview {
    ContentView()
}
