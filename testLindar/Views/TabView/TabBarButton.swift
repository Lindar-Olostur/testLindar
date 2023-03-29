//
//  TabBarButtonView.swift
//  testLindar
//
//  Created by Lindar Olostur on 28.03.2023.
//

import SwiftUI

struct TabBarButton: View {
    let image: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .fill(isSelected ? Color.gray.opacity(0.15) : Color.clear)
                    .scaleEffect(0.8)
                Image(systemName: image)
                    .font(.system(size: 20, weight: isSelected ? .medium : .regular))
                    .foregroundColor(.gray)
            }.padding(.bottom)
        }
    }
}

