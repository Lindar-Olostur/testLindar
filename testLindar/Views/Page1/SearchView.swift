//
//  SearchView.swift
//  testLindar
//
//  Created by Lindar Olostur on 28.03.2023.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: Page1ViewModel
    @FocusState private var fieldIsFocused: Bool
    
    var body: some View {
        VStack {
            TextField("What are you looking for?", text: $viewModel.searchText)
                .overlay(alignment: .trailing) {
                    Image(systemName: "magnifyingglass")
                        .opacity(0.6)
                }
                .font(.system(size: 12))
                .focused($fieldIsFocused)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(Color("llgray").opacity(0.7))
                .cornerRadius(25)
                .padding(.horizontal)
                .padding(.top, 20)
                .padding(.horizontal, 30)
            
            if viewModel.searchResults.count > 0 {
                List(viewModel.searchResults, id: \.self) { result in
                    Text(result)
                }
                .listStyle(.plain)
                .padding(.horizontal)
                .padding(.top, 10)
            }
        }
        .onReceive(viewModel.$searchText) { searchText in
            viewModel.search()
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Button("Hide") {
                    fieldIsFocused = false
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: Page1ViewModel())
    }
}
