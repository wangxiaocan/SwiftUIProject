//
//  Animation.swift
//  SwiftTest
//
//  Created by 王文科 on 2021/11/2.
//

import SwiftUI

struct Animation: View {
    
    @State var showDetail = true
    
    var body: some View {
        VStack {
            
            HStack {
                Text("Animation Button")
                Spacer()
                Button {
                    self.showDetail.toggle()

                } label: {
                    Image("btn_choose_arrow_right")
                        .scaleEffect(showDetail ? 1.5 : 1)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        .animation(.spring())
                }
                .padding()
                
            }
            
            Spacer()
            
            
        }
    }
}

struct Animation_Previews: PreviewProvider {
    static var previews: some View {
        Animation()
    }
}
