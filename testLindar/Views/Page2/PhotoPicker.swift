//
//  PhotoPicker.swift
//  testLindar
//
//  Created by Lindar Olostur on 29.03.2023.
//

import SwiftUI

struct PhotoPicker: View {
    @ObservedObject var viewModel: ProductViewModel
    let product: Product
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(product.imageUrls, id: \.self) { imageUrl in
                    if let url = URL(string: imageUrl) {
                        viewModel.image(withURL: url)
                            .scaledToFill()
                            .frame(width: 70, height: 45)
                            .clipped()
                            .cornerRadius(10.0)
                            .onTapGesture {
                                viewModel.selectedImageUrl = imageUrl
                            }
                            .scaleEffect(viewModel.selectedImageUrl == imageUrl ? 1.2 : 1.0)
                            .shadow(radius: viewModel.selectedImageUrl == imageUrl ? 6 : 0, y: viewModel.selectedImageUrl == imageUrl ? 6 : 0)
                            .padding(.horizontal, viewModel.selectedImageUrl == imageUrl ? 8 : 0)
                            .animation(.easeInOut)
                    }
                }

            }
            .padding(.horizontal, (UIScreen.main.bounds.width * 0.25) / 2)
            .padding()
        }
    }
}

struct PhotoPicker_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ProductViewModel()
        let product = Product(name: "Sample Product", description: "Sample Description", rating: 5.0, numberOfReviews: 400, price: 10, colors: ["Red", "Green", "Blue"], imageUrls: ["https://example.com/image.jpg"])
        PhotoPicker(viewModel: viewModel, product: product)
    }
}
