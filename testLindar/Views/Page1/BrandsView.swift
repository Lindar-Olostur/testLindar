//
//  BrandsView.swift
//  testLindar
//
//  Created by Lindar Olostur on 29.03.2023.
//

import SwiftUI

struct BrandsView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Brands")
                    .font(.custom("Montserrat-Bold", size: 20))
                Spacer()
                Button {
                    //
                } label: {
                    Text("View all")
                        .font(.custom("Montserrat-Bold", size: 12))
                        .foregroundColor(.gray)
                        .opacity(0.5)
                }
                
            }.padding(.top)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                        ForEach(0..<3) { _ in
                            Rectangle()
                                .foregroundColor(.black)
                                .frame(width: 110, height: 80)
                                .cornerRadius(10.0)
                        }
                    }
            }
        }
    }
}

struct BrandsView_Previews: PreviewProvider {
    static var previews: some View {
        BrandsView()
    }
}
