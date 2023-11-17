//
//  MapView.swift
//  Landmarks
//
//  Created by Sarah Clark on 11/11/23.
//

import MapKit
import SwiftUI

struct MapView: View {
    var coordinate: CLLocationCoordinate2D

    @AppStorage("MapView.zoom")
    private var zoom: Zoom = .medium

    enum Zoom: String, CaseIterable, Identifiable {
        case near = "Near"
        case medium = "Medium"
        case far = "Far"

        var id: Zoom {
            return self
        }
    }

    private var delta: CLLocationDegrees {
        switch zoom {
            case .near: return 0.02
            case .medium: return 0.2
            case .far: return 2
        }
    }

    var body: some View {
        Map(position: .constant(.region(region)))
    }

    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        )
    }
}

#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
}
