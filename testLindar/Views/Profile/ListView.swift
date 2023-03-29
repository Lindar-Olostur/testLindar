//
//  ListView.swift
//  testLindar
//
//  Created by Lindar Olostur on 29.03.2023.
//

import SwiftUI

struct ListView: View {
    @Binding var showSignInView: Bool
    
    var body: some View {
        VStack {
            List() {
                HStack {
                    ZStack {
                        Circle()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 35, height: 35)
                            .foregroundColor(.gray)
                            .opacity(0.2)
                        Image(systemName: "menubar.rectangle")
                    }
                    Text("Trade store").font(.custom("Montserrat-Regular", size: 14))
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .padding(.top, 3)
                .listRowSeparator(.hidden)
                HStack {
                    ZStack {
                        Circle()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 35, height: 35)
                            .foregroundColor(.gray)
                            .opacity(0.2)
                        Image(systemName: "menubar.rectangle")
                    }
                    Text("Payment method").font(.custom("Montserrat-Regular", size: 14))
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .padding(.top, 3)
                .listRowSeparator(.hidden)
                HStack {
                    ZStack {
                        Circle()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 35, height: 35)
                            .foregroundColor(.gray)
                            .opacity(0.2)
                        Image(systemName: "menubar.rectangle")
                    }
                    Text("Balance").font(.custom("Montserrat-Regular", size: 14))
                    Spacer()
                    Text("$ 1593")
                }
                .padding(.top, 3)
                .listRowSeparator(.hidden)
                HStack {
                    ZStack {
                        Circle()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 35, height: 35)
                            .foregroundColor(.gray)
                            .opacity(0.2)
                        Image(systemName: "menubar.rectangle")
                    }
                    Text("Trade history").font(.custom("Montserrat-Regular", size: 14))
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .padding(.top, 3)
                .listRowSeparator(.hidden)
                HStack {
                    ZStack {
                        Circle()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 35, height: 35)
                            .foregroundColor(.gray)
                            .opacity(0.2)
                        Image(systemName: "arrow.triangle.2.circlepath")
                    }
                    Text("Restore purchase").font(.custom("Montserrat-Regular", size: 14))
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .padding(.top, 3)
                .listRowSeparator(.hidden)
                HStack {
                    ZStack {
                        Circle()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 35, height: 35)
                            .foregroundColor(.gray)
                            .opacity(0.2)
                        Image(systemName: "questionmark.circle")
                    }
                    Text("Help").font(.custom("Montserrat-Regular", size: 14))
                }
                .padding(.top, 3)
                .listRowSeparator(.hidden)
                HStack {
                    ZStack {
                        Circle()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 35, height: 35)
                            .foregroundColor(.gray)
                            .opacity(0.2)
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                    }
                    Text("Log out").font(.custom("Montserrat-Regular", size: 14))
                }
                .padding(.top, 3)
                .listRowSeparator(.hidden)
                .onTapGesture {
                    showSignInView = true
                }
                
                .padding(.bottom, 80)
            }
            .listStyle(.plain)
            Spacer()

        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(showSignInView: .constant(false))
    }
}
