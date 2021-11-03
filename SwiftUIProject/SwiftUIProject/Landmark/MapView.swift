//
//  MapView.swift
//  SwiftTest
//
//  Created by 王文科 on 2021/10/30.
//

import SwiftUI

import MapKit


struct MapView : UIViewRepresentable{
    
    var landmark : LandMark
    
    func makeUIView(context: Context) -> MKMapView {
        return MKMapView(frame:.zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta:0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: landmark.locationCoordinate, span: span)
        uiView.setRegion(region, animated: true)
        
    }
    
    
}


struct PreView : PreviewProvider{
    static var previews: some View{
        MapView(landmark: landMarkData[0])
    }
}


