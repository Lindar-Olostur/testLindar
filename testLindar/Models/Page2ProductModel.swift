//
//  Page2ItemModel.swift
//  testLindar
//
//  Created by Lindar Olostur on 17.03.2023.
//

import Foundation

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

