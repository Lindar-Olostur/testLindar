//
//  ProductVM.swift
//  testLindar
//
//  Created by Lindar Olostur on 21.03.2023.
//

import Foundation
import SwiftUI

class ProductViewModel: ObservableObject {
    @Published var product: Product?
    @Published var selectedImageUrl: String = ""
    @Published var selectedColor: Color = .white
    @Published var itemsCount = 0

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

