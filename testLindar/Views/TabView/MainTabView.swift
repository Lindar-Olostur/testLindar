//
//  MainTabView.swift
//  testLindar
//
//  Created by Lindar Olostur on 15.03.2023.
//

import SwiftUI

struct MainTabView: View {
    @StateObject private var coordinator = MainTabViewCoordinator()
    
    var body: some View {
        ZStack {
            coordinator.view(for: coordinator.currentScreen)
            
            VStack(spacing: 0) {
                Spacer()
                HStack {
                    TabBarButton(image: "house", isSelected: coordinator.currentScreen == .home) {
                        coordinator.currentScreen = .home
                    }
                    TabBarButton(image: "heart", isSelected: coordinator.currentScreen == .favorites) {
                        coordinator.currentScreen = .favorites
                    }
                    TabBarButton(image: "cart", isSelected: coordinator.currentScreen == .cart) {
                        coordinator.currentScreen = .cart
                    }
                    TabBarButton(image: "bubble.left", isSelected: coordinator.currentScreen == .messages) {
                        coordinator.currentScreen = .messages
                    }
                    TabBarButton(image: "person", isSelected: coordinator.currentScreen == .profile) {
                        coordinator.currentScreen = .profile
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .circular))
            }
            .ignoresSafeArea()
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .environmentObject(Archive())
    }
}
