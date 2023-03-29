//
//  Page2View.swift
//  testLindar
//
//  Created by Lindar Olostur on 17.03.2023.
//

import SwiftUI

struct Page2View: View {
    @ObservedObject var viewModel = ProductViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                if let product = viewModel.product {
                    BigPhotoView(viewModel: viewModel, product: product)
                    PhotoPicker(viewModel: viewModel, product: product)
                    InfoBlockView(viewModel: viewModel, product: product).padding()
                    ColorPickerView(viewModel: viewModel, product: product)
                    CartView(viewModel: viewModel, product: product)
                } else {
                    VStack {
                        Spacer()
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .frame(width: 50, height: 50)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                }
            }
        }
        .onAppear {
            viewModel.fetchProduct()
        }
    }
}


struct Page2View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Page2View()
        }
    }
}
