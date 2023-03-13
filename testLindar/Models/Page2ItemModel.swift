//
//  Page2ItemModel.swift
//  testLindar
//
//  Created by Lindar Olostur on 17.03.2023.
//

import Foundation
import SwiftUI
import Combine


//MODEL
struct Product: Codable {
    let name: String
    let description: String
    let rating: Double
    let numberOfReviews: Int
    let price: Double
    let colors: [String]
    let imageUrls: [String]

    private enum CodingKeys: String, CodingKey {
        case name, description, rating, numberOfReviews = "number_of_reviews", price, colors, imageUrls = "image_urls"
    }
}


//VIEW MODEL
class ProductViewModel: ObservableObject {
    @Published var product: Product?

    func fetchProduct() {
        guard let url = URL(string: "https://run.mocky.io/v3/f7f99d04-4971-45d5-92e0-70333383c239") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let decodedProduct = try? JSONDecoder().decode(Product.self, from: data) {
                    DispatchQueue.main.async {
                        self.product = decodedProduct
                    }
                }
            }
        }.resume()
    }
}


