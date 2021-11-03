//
//  Badge.swift
//  SwiftTest
//
//  Created by 王文科 on 2021/11/1.
//

import SwiftUI

struct Badge: View {
    
    static let rotationCount = 8
    
    var badgeSymbols : some View {
        ForEach(0 ..< Self.rotationCount) { index in
            RotatedBadgeSymbol(angle: Angle(degrees: Double(index * 360 / Self.rotationCount)))
        }.opacity(0.5)
    }
    
    var body: some View {
        ZStack {
            BadgeBackgroud()
            
            GeometryReader {proxy in
                self.badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: proxy.size.width / 2.0, y: (3.0 / 4.0) * proxy.size.height)
            }
        }
        .scaledToFit()
    }
    
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
