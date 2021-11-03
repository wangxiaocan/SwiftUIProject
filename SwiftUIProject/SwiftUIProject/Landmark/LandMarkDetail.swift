//
//  ContentView.swift
//  SwiftTest
//
//  Created by 王文科 on 2021/10/30.
//

import SwiftUI

struct LandMarkDetail: View {
    
    @EnvironmentObject var userData : UserData
    
    var landmarkIndex : Int {
        userData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    
    var landmark : LandMark

    
    var body: some View {
        VStack {
            MapView(landmark: landmark)
                .frame(height: 300)
//                .edgesIgnoringSafeArea(.top)
            CircleImage(image: landmark.image)
                .offset(x: 0, y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                
                HStack{
                    Text(landmark.name).font(.title)
                    Button(action: {
                        if self.landmarkIndex != -1 {
                            self.userData.landmarks[self.landmarkIndex].isFavorite.toggle()
                        }
                    }){
                        if landmark.isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(.orange)
                        }
                        else {
                            Image(systemName: "star")
                                .foregroundColor(.gray)
                        }
                    }
                }
                
                HStack {
                    Text(landmark.state).font(.subheadline)
                    Spacer()
                    Text(landmark.park).font(.subheadline)
                }
                
            }.padding()
                
            Spacer()
        }
        .navigationBarTitle(Text(landmark.name), displayMode: .inline)
        
    }
}

struct CircleImage : View {
    var image : Image
    var body : some View{
        image
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .shadow(radius: 10)
    }

}

struct LandMarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandMarkDetail(landmark: landMarkData[0])
            .environmentObject(UserData())
    }
}
