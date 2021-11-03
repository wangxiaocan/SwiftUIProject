//
//  LandMarkRow.swift
//  SwiftTest
//
//  Created by 王文科 on 2021/11/1.
//

import SwiftUI

struct LandMarkRow: View {
    var landmark : LandMark
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50,height: 50)
            Text(landmark.name)
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.orange)
            }
            
        }
    }
}

struct LandMarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            LandMarkRow(landmark: landMarkData[0])
        }.previewLayout(.fixed(width: 300, height: 70))
        
    }
}
