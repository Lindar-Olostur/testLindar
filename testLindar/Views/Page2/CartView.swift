//
//  CartView.swift
//  testLindar
//
//  Created by Lindar Olostur on 29.03.2023.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var viewModel: ProductViewModel
    var product: Product
    
    var body: some View {
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
                                viewModel.itemsCount -= 1
                            } label: {
                                Image(systemName: "minus").font(.system(size: 10))
                            }
                            .frame(width: 80, height: 30)
                            .buttonStyle(BigBlueButton())
                            Button {
                                viewModel.itemsCount += 1
                            } label: {
                                Image(systemName: "plus").font(.system(size: 10))
                                    .padding(-6)
                            }
                            .frame(width: 80, height: 30)
                            .buttonStyle(BigBlueButton())
                            .padding(.leading, -20)
                        }
                    }
                    Button {
                        //
                    } label: {
                        HStack {
                            Text("#" + String(format: "%.2f", Double(viewModel.itemsCount) * 22.50))
                                .font(.custom("Montserrat-Regular", size: 10))
                                .foregroundColor(.gray)
                            Text("ADD TO CART")
                                .font(.custom("Montserrat-Bold", size: 10))
                                .padding(.horizontal)
                        }
                    }
                    .padding(.bottom, -16)
                    .frame(width: .infinity)
                    .buttonStyle(BigBlueButton())
                    
                }.padding(.vertical, 20)
                Spacer()
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ProductViewModel()
        let product = Product(name: "Sample Product", description: "Sample Description", rating: 5.0, numberOfReviews: 400, price: 10, colors: ["Red", "Green", "Blue"], imageUrls: ["https://example.com/image.jpg"])
        CartView(viewModel: viewModel, product: product)
    }
}
