import SwiftUI
import Combine

//struct SearchView: View {
//    @StateObject var viewModel = SearchViewModel()
//
//    var body: some View {
//        VStack {
//            TextField("Search", text: $viewModel.searchText)
//                .padding(.horizontal, 20)
//                .padding(.vertical, 10)
//                .background(Color.gray.opacity(0.2))
//                .cornerRadius(10)
//                .padding(.horizontal)
//                .padding(.top, 20)
//
//            if viewModel.searchResults.count > 0 {
//                List(viewModel.searchResults, id: \.self) { result in
//                    Text(result)
//                }
//                .padding(.horizontal)
//                .padding(.top, 10)
//            }
//        }
//        .onChange(of: viewModel.searchText) { text in
//            viewModel.search()
//        }
//    }
//}

class SearchViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var searchResults: [String] = []

    private var cancellable: AnyCancellable?

    func search() {
        cancellable?.cancel()
        guard !searchText.isEmpty else {
            searchResults = []
            return
        }

        let url = URL(string: "https://run.mocky.io/v3/4c9cd822-9479-4509-803d-63197e5a9e19")!
        let request = URLRequest(url: url)
        cancellable = URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: SearchResponse.self, decoder: JSONDecoder())
            .replaceError(with: SearchResponse(words: []))
            .map { response in
                response.words.filter { word in
                    word.lowercased().starts(with: self.searchText.lowercased())
                }
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] results in
                self?.searchResults = results
            })
    }
}

struct SearchResponse: Decodable {
    let words: [String]
}

