//
//  testLindarApp.swift
//  testLindar
//
//  Created by Lindar Olostur on 13.03.2023.
//

import SwiftUI

@main
struct testLindarApp: App {
    
    @StateObject var archive: Archive = Archive()
    var body: some Scene {
        WindowGroup {
            SignInView()
                .environmentObject(archive)
                
        }
    }
}
