//
//  Page2View.swift
//  testLindar
//
//  Created by Lindar Olostur on 17.03.2023.
//

import SwiftUI

struct Page2View: View {
    @ObservedObject var viewModel = ProductViewModel()
    @State private var selectedImageUrl: String = ""
    @State private var selectedColor: Color = .white
    @State private var itemsCount = 0
    
    var body: some View {
        
        GeometryReader { geometry in
            ScrollView(.vertical) {
                if let product = viewModel.product {
                    VStack(alignment: .leading) {
                        HStack {
                            ZStack {
                                HStack {
                                    if let url = URL(string: selectedImageUrl) ?? URL(string: product.imageUrls.first ?? "") {
                                        AsyncImage(url: url) { phase in
                                            switch phase {
                                            case .empty:
                                                ProgressView()
                                            case .success(let image):
                                                image
                                                    .resizable()
                                                    .frame(width: .infinity, height: nil)
                                                    .aspectRatio(contentMode: .fit)
                                            case .failure:
                                                Image(systemName: "photo")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                            @unknown default:
                                                fatalError()
                                            }
                                        }
                                        .cornerRadius(18, corners: [.topRight, .bottomRight])
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
                                    } else {
                                        if let url = URL(string: product.imageUrls.first ?? "") {
                                            AsyncImage(url: url) { phase in
                                                switch phase {
                                                case .empty:
                                                    ProgressView()
                                                case .success(let image):
                                                    image
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                case .failure:
                                                    Image(systemName: "photo")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                @unknown default:
                                                    fatalError()
                                                }
                                            }
                                        } else {
                                            Image(systemName: "photo")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                        }
                                    }
                                }
                                
                            }
                            .padding(.top)
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(product.imageUrls, id: \.self) { imageUrl in
                                    AsyncImage(url: URL(string: imageUrl)) { phase in
                                        switch phase {
                                        case .empty:
                                            // Placeholder view
                                            Image(systemName: "photo")
                                        case .success(let image):
                                            // Display the loaded image
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                        case .failure(let error):
                                            // Error view
                                            Text(error.localizedDescription)
                                        @unknown default:
                                            // Placeholder view
                                            Image(systemName: "photo")
                                        }
                                    }
                                    .scaledToFill()
                                    .frame(width: 70, height: 45)
                                    .clipped()
                                    .cornerRadius(10.0)
                                    .onTapGesture {
                                        selectedImageUrl = imageUrl
                                    }
                                    .scaleEffect(selectedImageUrl == imageUrl ? 1.2 : 1.0)
                                    .shadow(radius: selectedImageUrl == imageUrl ? 6 : 0, y: selectedImageUrl == imageUrl ? 6 : 0)
                                    .padding(.horizontal, selectedImageUrl == imageUrl ? 8 : 0)
                                    .animation(.easeInOut)
                                }
                            }
                            .padding(.horizontal, (geometry.size.width * 0.25) / 2)
                            .padding()
                        }
                    }
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 10) {
                            Text(product.name)
                                .font(.custom("Montserrat-Bold", size: 20))
                                .lineLimit(nil)
                            Text(product.description)
                                .font(.custom("Montserrat-Regular", size: 12))
                                .foregroundColor(.gray)
                                .lineLimit(nil)
                                .fixedSize(horizontal: false, vertical: true)
                            HStack(spacing: 3) {
                                Image(systemName: "star")
                                    .foregroundColor(.yellow)
                                    .font(.system(size: 10))
                                Text(String(format: "%.1f", product.rating))
                                    .font(.custom("Montserrat-Bold", size: 13))
                                Text("(\(product.numberOfReviews) reviews)")
                                    .font(.custom("Montserrat-Regular", size: 10))
                                    .foregroundColor(.gray)
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width / 2)
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text("$ " + String(format: "%.2f", product.price))
                                .font(.custom("Montserrat-Bold", size: 14))
                        }
                    }.padding()
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Color:")
                                .font(.custom("Montserrat-Bold", size: 14))
                                .foregroundColor(.gray)
                            HStack(spacing: 20) {
                                Button(action: {
                                    self.selectedColor = .white
                                }) {
                                    Rectangle()
                                        .fill(Color.white)
                                            .frame(width: 50, height: 35)
                                            .cornerRadius(14)
                                            .overlay(
                                                selectedColor == .white ? RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 3) : nil
                                            )
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 14)
                                                    .stroke(Color.gray, lineWidth: 1)
                                            )
                                }
                                Button(action: {
                                    self.selectedColor = .gray
                                }) {
                                    Rectangle()
                                        .fill(Color.gray)
                                        .frame(width: 50, height: 35)
                                        .cornerRadius(14)
                                        .overlay(
                                            selectedColor == .gray ? RoundedRectangle(cornerRadius: 14).stroke(Color.gray, lineWidth: 3) : nil
                                        )
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 14)
                                                .stroke(Color.gray, lineWidth: 1)
                                        )
                                }
                                Button(action: {
                                    self.selectedColor = .black
                                }) {
                                    Rectangle()
                                        .fill(Color.black)
                                        .frame(width: 50, height: 35)
                                        .cornerRadius(14)
                                        .overlay(
                                            selectedColor == .black ? RoundedRectangle(cornerRadius: 14).stroke(Color.gray, lineWidth: 3) : nil
                                        )
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 14)
                                                .stroke(Color.gray, lineWidth: 1)
                                        )
                                }
                            }
                        }.padding()
                        Spacer()
                    }
                    ZStack {
                        Rectangle()
                            .fill(Color("cartColor"))
                            .cornerRadius(30)
                            .frame(minHeight: 250)
                            .ignoresSafeArea()
                        VStack {
                            HStack(alignment: .bottom) {
                                VStack(alignment: .leading) {
                                    Text("Quantity:")
                                        .font(.custom("Montserrat-Regular", size: 14))
                                        .foregroundColor(.gray)
                                        .padding(.horizontal)
                                    HStack {
                                        Button {
                                            itemsCount -= 1
                                        } label: {
                                            Image(systemName: "minus")
                                        }
                                        .frame(width: 90, height: 40)
                                        .buttonStyle(BigBlueButton())
                                        Button {
                                            itemsCount += 1
                                        } label: {
                                            Image(systemName: "plus")
                                                .padding(-6)
                                        }
                                        .frame(width: 90, height: 40)
                                        .buttonStyle(BigBlueButton())
                                    }
                                }
                                Button {
                                    //
                                } label: {
                                    HStack {
                                        Text("#" + String(format: "%.2f", Double(itemsCount) * 22.50))
                                            .font(.custom("Montserrat-Regular", size: 10))
                                            .foregroundColor(.gray)
                                        Text("ADD TO CART")
                                            .font(.custom("Montserrat-Bold", size: 10))
                                            .padding(.horizontal)
                                    }
                                }
                                .frame(width: .infinity)
                                .buttonStyle(BigBlueButton())
                                
                            }.padding(.vertical, 20)
                            Spacer()
                        }
                    }
                } else {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
                
            }
        }
        .onAppear {
            viewModel.fetchProduct()
        }
    }
}


struct Page2View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Page2View()
        }
    }
}
