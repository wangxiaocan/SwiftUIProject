//
//  BadgeSymbol.swift
//  SwiftTest
//
//  Created by 王文科 on 2021/11/2.
//

import SwiftUI

struct BadgeSymbol: View {
    
    static let symbolColor = Color(red: 79.0 / 255.0, green: 79.0 / 255.0, blue: 191.0 / 255.0)
    
    var body: some View {
        GeometryReader { proxy in
            Path { path in
                
                let width = min(proxy.size.width, proxy.size.height)
                let height = width * 0.75
                let spacing = width * 0.030
                let middle = width / 2.0
                let topWidth = 0.226 * width
                let topHeight = 0.488 * height
                
                path.addLines([
                    .init(x: middle, y: spacing),
                    .init(x: middle - topWidth, y: topHeight - spacing),
                    .init(x: middle, y: topHeight / 2 + spacing),
                    .init(x: middle + topWidth, y: topHeight - spacing),
                    .init(x: middle, y: spacing)
                ])
                
                path.move(to: .init(x: middle, y: topHeight / 2 + spacing * 3))
                
                path.addLines([
                    .init(x: middle - topWidth, y: topHeight + spacing),
                    .init(x: spacing, y: height - spacing),
                    .init(x: width - spacing, y: height - spacing),
                    .init(x: middle + topWidth, y: topHeight + spacing),
                    .init(x: middle, y: topHeight / 2 + spacing * 3)
                ])
                
            }.fill(BadgeSymbol.symbolColor)
        }
    }
}

struct BadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        BadgeSymbol()
    }
}
