//
//  Landmark.swift
//  SwiftTest
//
//  Created by 王文科 on 2021/11/1.
//

import SwiftUI

import CoreLocation

struct LandMark : Hashable, Codable, Identifiable {
    var id : Int
    var name : String
    fileprivate var imageName : String
    fileprivate var coordinates : Coordinates
    var state : String
    var park : String
    var category : Category
    var isFavorite : Bool

    
        
    var locationCoordinate : CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    
    enum Category : String, CaseIterable, Codable, Hashable {
        case featured = "Featured"
        case lakes = "Lakes"
        case rivers = "Rivers"
    }
    
}

extension LandMark{
    var image : Image {
        ImageStore.shared.image(name: imageName)
    }
}

struct Coordinates : Hashable, Codable {
    var latitude : Double
    var longitude : Double
}
