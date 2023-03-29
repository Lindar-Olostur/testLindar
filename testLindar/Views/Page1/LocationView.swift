//
//  LocationView.swift
//  testLindar
//
//  Created by Lindar Olostur on 29.03.2023.
//

import SwiftUI

struct LocationView: View {
    var body: some View {
        VStack {
            Image("photo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 35, height: 35)
                .clipShape(Circle())
                .padding(.bottom, -7)
            Button {
                //
            } label: {
                HStack {
                    Text("Location")
                        .font(.custom("Montserrat-Regular", size: 13))
                        .foregroundColor(.black)
                    Image(systemName: "chevron.down")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 6, height: 6)
                        .foregroundColor(.black)
                }
            }
            .padding(.bottom, -8)
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
