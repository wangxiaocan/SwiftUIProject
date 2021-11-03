//
//  LandMarkList.swift
//  SwiftTest
//
//  Created by 王文科 on 2021/11/1.
//

import SwiftUI

struct LandMarkList: View {
    
    @EnvironmentObject var userData : UserData
    
    var body: some View {
        List(){
            Toggle(isOn: $userData.showFavoritesOnly){
                Text("Change state")
            }
            ForEach(userData.landmarks){landmark in
                if !self.userData.showFavoritesOnly || landmark.isFavorite {
                    NavigationLink(destination: LandMarkDetail(landmark: landmark)) {
                        LandMarkRow(landmark: landmark)
                    }
                }
            }
            
        }.navigationBarTitle(Text("SwiftUI"))
    }
}

struct LandMarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandMarkList().environmentObject(UserData())
    }
}
