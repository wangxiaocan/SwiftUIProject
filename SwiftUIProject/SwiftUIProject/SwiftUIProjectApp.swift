//
//  SwiftUIProjectApp.swift
//  SwiftUIProject
//
//  Created by 王文科 on 2021/11/3.
//

import SwiftUI

@main
struct SwiftUIProjectApp: App {
    var body: some Scene {
        WindowGroup {
            CategoryHome()
                .environmentObject(UserData())
        }
    }
}
