//
//  CategoryHome.swift
//  SwiftTest
//
//  Created by 王文科 on 2021/11/3.
//

import SwiftUI

struct CategoryHome: View {
    
    var categories : [String : [LandMark]] {
        Dictionary(grouping: landMarkData) { landmark in
            landmark.category.rawValue
        }
    }
    
    var featuredLandmarks : [LandMark] {
        landMarkData.filter { landmart in
            landmart.isFavorite
        }
    }
    
    @State var showPreset = false
    
    
    var profileButton : some View {
        Button {
            self.showPreset.toggle()
        } label: {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("user info"))
                .padding()
        }

    }
    
    var body: some View {
        NavigationView {
            List {
                FeaturedLandmarks(landmarks: featuredLandmarks)
                    .scaledToFill()
                    .listRowInsets(EdgeInsets())
                    .frame(height: 200)
                    .clipped()
                
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: categories[key]!)
                        .listRowInsets(EdgeInsets())
                }
                
                NavigationLink(destination: LandMarkList()) {
                    Text("See all")
                }
            }
            .navigationBarTitle("Featured")
            .navigationBarItems(trailing: profileButton)

        }
        .listStyle(.plain)
        .sheet(isPresented: $showPreset) {
            
        } content: {
            Text("User info")
        }


    }
}

struct FeaturedLandmarks : View {
    var landmarks : [LandMark]
    var body: some View {
        landmarks[0].image
            .resizable()
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(UserData())
    }
}
