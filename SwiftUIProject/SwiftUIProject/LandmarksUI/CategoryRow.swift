//
//  CategoryRow.swift
//  SwiftUIProject
//
//  Created by 王文科 on 2021/11/3.
//

import SwiftUI

struct CategoryRow: View {
    
    var categoryName : String
    
    var items : [LandMark]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(items, id: \.self) { landmark in
                        NavigationLink(destination: LandMarkDetail(landmark: landmark)) {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
        .padding(.trailing, 15)
    }
}

struct CategoryItem : View {
    
    var landmark : LandMark
    
    var body: some View{
        VStack(alignment: .leading) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(landmark.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CategoryRow(categoryName: landMarkData[0].category.rawValue, items: Array(landMarkData.prefix(3)))
                .environmentObject(UserData())
        }
    }
}
