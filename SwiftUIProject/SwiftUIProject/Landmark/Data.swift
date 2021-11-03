//
//  Data.swift
//  SwiftTest
//
//  Created by 王文科 on 2021/11/1.
//

import SwiftUI

import UIKit
import CoreLocation

let landMarkData : [LandMark] = load("landmarkData.json")

func load<T: Decodable>(_ fileName : String) -> T{
    let data : Data
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError("Couldn't find \(fileName) in main bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch  {
        fatalError("Couldn't load \(fileName) from main bundle with error:\(error)")
    }
    
    do {
        let decode = JSONDecoder()
        return try decode.decode(T.self, from: data)
    } catch {
        fatalError("Decode \(fileName) data error")
    }
}


final class ImageStore{
    typealias _ImageDictionary = [String:CGImage]
    fileprivate var images : _ImageDictionary = [:]
    
    fileprivate static var scale = 2
    
    static var shared = ImageStore()
    
    func image(name: String) -> Image{
        let inx = _guaranteeImage(name: name)
        return Image(images.values[inx], scale: CGFloat(ImageStore.scale), label: Text(name))
    }
    
    
    static func loadImage(name: String) -> CGImage{
        guard
            let url = Bundle.main.url(forResource: name, withExtension: "jpg"),
            let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
            let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
        else {
            fatalError("load image error:\(name)")
        }
        return image
    }
    
    
    fileprivate func _guaranteeImage(name: String) -> _ImageDictionary.Index{
        if let indx = images.index(forKey: name) {return indx}
        
        images[name] = ImageStore.loadImage(name: name)
        return images.index(forKey: name)!
    }
    
}
