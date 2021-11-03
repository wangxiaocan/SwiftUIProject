//
//  SwiftUIView.swift
//  SwiftTest
//
//  Created by 王文科 on 2021/11/1.
//

import SwiftUI

import Combine

final class UserData : ObservableObject {
    @Published var showFavoritesOnly = true
    @Published var landmarks = landMarkData
}
