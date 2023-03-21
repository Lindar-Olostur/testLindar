//
//  SearchPanelVM.swift
//  testLindar
//
//  Created by Lindar Olostur on 21.03.2023.
//

import Foundation
import Combine

//class SearchViewModel: ObservableObject {
//    @Published var searchText = ""
//    @Published var searchResults: [String] = []
//
//    
//
//    func search() {
//        var cancellable: AnyCancellable?
//        cancellable?.cancel()
//        guard !searchText.isEmpty else {
//            searchResults = []
//            return
//        }
//
//        let url = URL(string: "https://run.mocky.io/v3/4c9cd822-9479-4509-803d-63197e5a9e19")!
//        let request = URLRequest(url: url)
//        cancellable = URLSession.shared.dataTaskPublisher(for: request)
//            .map { $0.data }
//            .decode(type: SearchResponse.self, decoder: JSONDecoder())
//            .replaceError(with: SearchResponse(words: []))
//            .map { response in
//                response.words.filter { word in
//                    word.lowercased().starts(with: self.searchText.lowercased())
//                }
//            }
//            .receive(on: DispatchQueue.main)
//            .sink(receiveValue: { [weak self] results in
//                self?.searchResults = results
//            })
//    }
//}
