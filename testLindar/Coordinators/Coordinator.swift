//
//  Coordinator.swift
//  testLindar
//
//  Created by Lindar Olostur on 21.03.2023.
//

import Foundation
import SwiftUI

class MainTabViewCoordinator: ObservableObject {
    enum Screen {
        case home
        case favorites
        case cart
        case messages
        case profile
    }
    
    @Published var currentScreen: Screen = .home
    
    func view(for screen: Screen) -> some View {
        switch screen {
        case .home:
            return AnyView(Page1View())
        case .favorites:
            return AnyView(EmptyView())
        case .cart:
            return AnyView(EmptyView())
        case .messages:
            return AnyView(EmptyView())
        case .profile:
            return AnyView(ProfileView())
        }
    }
}
