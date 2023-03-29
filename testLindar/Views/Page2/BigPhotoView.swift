//
//  BigPhotoView.swift
//  testLindar
//
//  Created by Lindar Olostur on 29.03.2023.
//

import SwiftUI

struct BigPhotoView: View {
    @ObservedObject var viewModel: ProductViewModel
    let product: Product
    
    var body: some View {
        HStack {
            if let url = URL(string: viewModel.selectedImageUrl) ?? URL(string: product.imageUrls.first ?? "") {
                viewModel.image(withURL: url)
                .cornerRadius(18, corners: [.topRight, .bottomRight])
                SideButtonsView()
            } else {
                if let url = URL(string: product.imageUrls.first ?? "") {
                    viewModel.image(withURL: url)
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
        }
    }
}

struct BigPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ProductViewModel()
        let product = Product(name: "Sample Product", description: "Sample Description", rating: 5.0, numberOfReviews: 400, price: 10, colors: ["Red", "Green", "Blue"], imageUrls: ["https://example.com/image.jpg"])
        BigPhotoView(viewModel: viewModel, product: product)
    }
}

