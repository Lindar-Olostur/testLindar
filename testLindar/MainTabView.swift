//
//  MainTabView.swift
//  testLindar
//
//  Created by Lindar Olostur on 15.03.2023.
//

import SwiftUI

struct MainTabView: View {
    @State private var screen = 0
    
    var body: some View {
        TabView(selection: $screen) {
            Page1View()
                .tabItem() {
                    Image(systemName: "house")
                }.tag(0)
            Page1View()
                .tabItem {
                    Image(systemName: "heart")
                }.tag(1)
            Page1View()
                .tabItem {
                    Image(systemName: "cart")
                }.tag(2)
            Page1View()
                .tabItem {
                    Image(systemName: "bubble.left")
                }.tag(3)
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                }.tag(4)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .environmentObject(Archive())
    }
}
