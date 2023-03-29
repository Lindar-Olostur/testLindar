//
//  LatestView.swift
//  testLindar
//
//  Created by Lindar Olostur on 29.03.2023.
//

import SwiftUI

struct LatestView: View {
    @ObservedObject var viewModel: Page1ViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Latest")
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
                HStack {
                    ForEach(viewModel.items, id: \.name) { item in
                        ZStack {
                            AsyncImage(url: item.imageUrl) { image in
                                image
                                    .resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .scaledToFill()
                            .frame(width: 120, height: 150)
                            .clipped()
                            .cornerRadius(10.0)
                            HStack {
                                VStack(alignment: .leading) {
                                    Spacer()
                                    Text(item.category)
                                        .font(.custom("Montserrat-Bold", size: 8))
                                        .padding(5)
                                        .background(Color("llgray").opacity(0.7))
                                        .clipShape(Capsule())
                                    Text(item.name)
                                        .font(.custom("Montserrat-Bold", size: 10))
                                        .foregroundColor(.white)
                                    HStack {
                                        Text("$ \(item.price)")
                                            .font(.custom("Montserrat-Bold", size: 10))
                                            .foregroundColor(.white)
                                            .opacity(0.8)
                                            .padding(.top, 4)
                                        Spacer()
                                        Button {
                                            //
                                        } label: {
                                            Image(systemName: "plus")
                                                .padding(5)
                                                .background(Color("llgray"))
                                                .foregroundColor(.black)
                                                .clipShape(Circle())
                                        }
                                    }.padding(.bottom, 6)
                                }
                                .padding(.horizontal, 6)
                                
                            }
                        }
                        .frame(width: 120, height: 150)
                    }
                }
            }
        }
    }
}

struct LatestView_Previews: PreviewProvider {
    static var previews: some View {
        LatestView(viewModel: Page1ViewModel())
    }
}
