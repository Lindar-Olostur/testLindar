//
//  LatestModel.swift
//  testLindar
//
//  Created by Lindar Olostur on 15.03.2023.
//

import Foundation

struct Latest: Codable {
    let category: String
    let name: String
    let price: Int
    let imageUrl: URL
    
    enum CodingKeys: String, CodingKey {
        case category, name, price
        case imageUrl = "image_url"
    }
}

struct LatestResponse: Codable {
    let latest: [Latest]
}

struct Flash: Codable {
    let category: String
    let name: String
    let price: Double
    let discount: Int
    let imageUrl: URL
    
    enum CodingKeys: String, CodingKey {
        case category, name, price, discount
        case imageUrl = "image_url"
    }
}

struct FlashResponse: Codable {
    let flash_sale: [Flash]
}

