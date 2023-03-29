//
//  ColorPickerView.swift
//  testLindar
//
//  Created by Lindar Olostur on 29.03.2023.
//

import SwiftUI

struct ColorPickerView: View {
    @ObservedObject var viewModel: ProductViewModel
    let product: Product
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Color:")
                    .font(.custom("Montserrat-Bold", size: 14))
                    .foregroundColor(.gray)
                HStack(spacing: 20) {
                    Button(action: {
                        viewModel.selectedColor = .white
                    }) {
                        Rectangle()
                            .fill(Color.white)
                                .frame(width: 50, height: 35)
                                .cornerRadius(14)
                                .overlay(
                                    viewModel.selectedColor == .white ? RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 3) : nil
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 14)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                    }
                    Button(action: {
                        viewModel.selectedColor = .gray
                    }) {
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: 50, height: 35)
                            .cornerRadius(14)
                            .overlay(
                                viewModel.selectedColor == .gray ? RoundedRectangle(cornerRadius: 14).stroke(Color.gray, lineWidth: 3) : nil
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                    }
                    Button(action: {
                        viewModel.selectedColor = .black
                    }) {
                        Rectangle()
                            .fill(Color.black)
                            .frame(width: 50, height: 35)
                            .cornerRadius(14)
                            .overlay(
                                viewModel.selectedColor == .black ? RoundedRectangle(cornerRadius: 14).stroke(Color.gray, lineWidth: 3) : nil
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
    }
}

struct ColorPickerView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ProductViewModel()
        let product = Product(name: "Sample Product", description: "Sample Description", rating: 5.0, numberOfReviews: 400, price: 10, colors: ["Red", "Green", "Blue"], imageUrls: ["https://example.com/image.jpg"])
        ColorPickerView(viewModel: viewModel, product: product)
    }
}
