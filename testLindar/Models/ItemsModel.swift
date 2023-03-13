//
//  LatestModel.swift
//  testLindar
//
//  Created by Lindar Olostur on 15.03.2023.
//

import Foundation
import SwiftUI
import Combine

func fetchLatestItems() -> AnyPublisher<LatestResponse, Error> {
    let url = URL(string: "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7")!
    return URLSession.shared.dataTaskPublisher(for: url)
        .map { $0.data }
        .decode(type: LatestResponse.self, decoder: JSONDecoder())
        .eraseToAnyPublisher()
}

func fetchFlashSaleItems() -> AnyPublisher<FlashResponse, Error> {
    let url = URL(string: "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac")!
    return URLSession.shared.dataTaskPublisher(for: url)
        .map { $0.data }
        .decode(type: FlashResponse.self, decoder: JSONDecoder())
        .eraseToAnyPublisher()
}

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



//SEARCH
struct WordsResponse: Codable {
    let words: [String]
}
func fetchWords() -> AnyPublisher<WordsResponse, Error> {
    let url = URL(string: "https://run.mocky.io/v3/4c9cd822-9479-4509-803d-63197e5a9e19")!
    return URLSession.shared.dataTaskPublisher(for: url)
        .map { $0.data }
        .decode(type: WordsResponse.self, decoder: JSONDecoder())
        .eraseToAnyPublisher()
}
