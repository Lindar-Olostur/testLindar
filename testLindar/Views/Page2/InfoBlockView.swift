//
//  InfoBlockView.swift
//  testLindar
//
//  Created by Lindar Olostur on 29.03.2023.
//

import SwiftUI

struct InfoBlockView: View {
    @ObservedObject var viewModel: ProductViewModel
    let product: Product
    
    var body: some View {
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
        }
    }
}

struct InfoBlockView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ProductViewModel()
        let product = Product(name: "Sample Product", description: "Sample Description", rating: 5.0, numberOfReviews: 400, price: 10, colors: ["Red", "Green", "Blue"], imageUrls: ["https://example.com/image.jpg"])
        InfoBlockView(viewModel: viewModel, product: product)
    }
}
