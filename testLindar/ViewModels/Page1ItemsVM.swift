//
//  Page1VM.swift
//  testLindar
//
//  Created by Lindar Olostur on 21.03.2023.
//

import Foundation
import Combine

class Page1ViewModel: ObservableObject {
    @Published var items: [Latest] = []
    @Published var flash: [Flash] = []
    @Published var searchText = ""
    @Published var searchResults: [String] = []
    
    private var cancellable: AnyCancellable?
    
    func search() {
        guard !searchText.isEmpty else {
            searchResults = []
            return
        }
        
        cancellable?.cancel()
        cancellable = Just(searchText)
            .delay(for: 1, scheduler: DispatchQueue.main)
            .setFailureType(to: Error.self)
            .flatMap { searchText -> AnyPublisher<[String], Error> in
                APIClient.fetchData(from: URL(string: "https://run.mocky.io/v3/4c9cd822-9479-4509-803d-63197e5a9e19")!)
                    .map { (response: SearchResponse) -> [String] in
                        response.words.filter { word in
                            word.lowercased().starts(with: searchText.lowercased())
                        }
                    }
                    .eraseToAnyPublisher()
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] results in
                self?.searchResults = results
            })
    }

    func fetchLatestItems() -> AnyPublisher<LatestResponse, Error> {
        return APIClient.fetchData(from: URL(string: "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7")!)
    }

    func fetchFlashSaleItems() -> AnyPublisher<FlashResponse, Error> {
        return APIClient.fetchData(from: URL(string: "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac")!)
    }
}
