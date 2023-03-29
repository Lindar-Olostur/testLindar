//
//  APIClient.swift
//  testLindar
//
//  Created by Lindar Olostur on 28.03.2023.
//

import Foundation
import Combine

class APIClient {
    static func fetchData<T: Decodable>(from url: URL) -> AnyPublisher<T, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .mapError { error -> Error in
                print("Error: \(error.localizedDescription)")
                return error
            }
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
