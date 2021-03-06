//
//  BadgeBackgroud.swift
//  SwiftTest
//
//  Created by 王文科 on 2021/11/2.
//

import SwiftUI

struct BadgeBackgroud: View {
    var body: some View {
        GeometryReader { prox in
            Path { (path) in
                                
                var width : CGFloat = min(prox.size.width, prox.size.height)
                let height = width
                
                let xScale = 0.8
                let xOffset = (width * (1.0 - xScale)) / 2.0
                
                width *= xScale
                
                path.move(to: .init(
                    x: xOffset + width * 0.95,
                    y: height * (0.20 + HexagonParameters.adjustment)))
                
                HexagonParameters.points.forEach { segment in
                    path.addLine(to: .init(
                        x: xOffset + width * segment.useWidth.0 * segment.xFactors.0,
                        y: height * segment.useHeight.0 * segment.yFactors.0))
                    
                    path.addQuadCurve(
                        to: .init(
                            x: xOffset + width * segment.useWidth.1 * segment.xFactors.1,
                            y: height * segment.useHeight.1 * segment.yFactors.1),
                        control: .init(
                            x: xOffset + width * segment.useWidth.2 * segment.xFactors.2,
                            y: height * segment.useHeight.2 * segment.yFactors.2))
                    
                }
                
            }
            .fill(LinearGradient(gradient: Gradient(colors: [BadgeBackgroud.gradientStart, BadgeBackgroud.gradientEnd]), startPoint: UnitPoint(x: 0.5, y: 0), endPoint: UnitPoint(x: 0.5, y: 0.6)))
            .aspectRatio(1, contentMode: .fit)
        }
        
    }
    
    static let gradientStart = Color(red: 239.0 / 255.0, green: 120.0 / 255.0, blue: 221.0 / 255.0)
    static let gradientEnd = Color(red: 239.0 / 255.0, green: 172.0 / 255.0, blue: 120.0 / 255.0)
    
}

struct BadgeBackgroud_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackgroud()
    }
}
