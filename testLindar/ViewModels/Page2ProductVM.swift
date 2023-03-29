//
//  ProductVM.swift
//  testLindar
//
//  Created by Lindar Olostur on 21.03.2023.
//

import Foundation
import SwiftUI
import Combine

class ProductViewModel: ObservableObject {
    @Published var product: Product?
    @Published var selectedImageUrl: String = ""
    @Published var selectedColor: Color = .white
    @Published var itemsCount = 0

    private var cancellable: AnyCancellable?

    func fetchProduct() {
        guard let url = URL(string: "https://run.mocky.io/v3/f7f99d04-4971-45d5-92e0-70333383c239") else {
            return
        }

        cancellable = APIClient.fetchData(from: url)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }, receiveValue: { [weak self] product in
                self?.product = product
            })
    }
    
    func image(withURL url: URL) -> some View {
    AsyncImage(url: url) { phase in
        switch phase {
        case .empty:
            ProgressView()
        case .success(let image):
            image
                .resizable()
                .frame(width: .infinity, height: nil)
                .aspectRatio(contentMode: .fit)
        case .failure:
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
        @unknown default:
            fatalError()
        }
    }
}
}


