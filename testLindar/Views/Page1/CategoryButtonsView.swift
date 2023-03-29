//
//  CategoryButtonsView.swift
//  testLindar
//
//  Created by Lindar Olostur on 29.03.2023.
//

import SwiftUI

struct CategoryButtonsView: View {
    private let icons: [(String, String)] = [("iphone", "Phones"), ("headphones", "Headphones"), ("gamecontroller", "Games"), ("car", "Cars"), ("sofa", "Furniture"), ("figure.and.child.holdinghands", "Kids")]
    
    var body: some View {
        HStack {
            ForEach(0..<icons.count) { i in
                Button {
                    //
                } label: {
                    VStack {
                        ZStack {
                            Circle()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 40, height: 40)
                                .foregroundColor(.gray)
                                .opacity(0.2)
                            Image(systemName: icons[i].0)
                        }
                        Text(icons[i].1)
                            .font(.custom("Montserrat-Regular", size: 8))
                            .opacity(0.5)
                    }.padding(.horizontal, 5)
                }
                .foregroundColor(.black)
            }
        }
    }
}

struct CategoryButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryButtonsView()
    }
}
