//
//  SideButtonsView.swift
//  testLindar
//
//  Created by Lindar Olostur on 29.03.2023.
//

import SwiftUI

struct SideButtonsView: View {
    var body: some View {
        VStack {
            Image(systemName: "heart")
            Text("-")
            Image("share")
                .resizable()
                .frame(width: 30, height: 30)
                .padding(.top, -10)
        }
        .padding(.vertical, 14)
        .padding(.horizontal, 10)
        .background(Color("llgray"))
        .clipShape(Rectangle()).cornerRadius(16)
        .font(.system(size: 25))
        .offset(x: -35, y: 60)
    }
}

struct SideButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        SideButtonsView()
    }
}
