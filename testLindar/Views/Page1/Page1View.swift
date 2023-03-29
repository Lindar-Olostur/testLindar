//
//  Page1.swift
//  testLindar
//
//  Created by Lindar Olostur on 14.03.2023.
//

import SwiftUI
import Combine

struct Page1View: View {
    @ObservedObject var page1viewModel = Page1ViewModel()
    @State var cancellable: AnyCancellable?
    
    
    var body: some View {
        
        NavigationView {
            VStack {
            SearchView(viewModel: page1viewModel)
                ScrollView(showsIndicators: false) {
                    CategoryButtonsView()
                    LatestView(viewModel: page1viewModel)
                    FlashSaleView(viewModel: page1viewModel)
                    BrandsView()
                    Spacer()
                }
                .navigationBarTitle("", displayMode: .inline)
                .onAppear {
                    cancellable = Publishers.Zip(page1viewModel.fetchLatestItems(), page1viewModel.fetchFlashSaleItems())
                        .sink(
                            receiveCompletion: { completion in
                                switch completion {
                                case .failure(let error):
                                    print("Error: \(error.localizedDescription)")
                                case .finished:
                                    print("Finished fetching data")
                                }
                            }, receiveValue: { latestItemsResponse, flashSaleItemsResponse in
                                DispatchQueue.main.async {
                                    page1viewModel.items = latestItemsResponse.latest
                                    page1viewModel.flash = flashSaleItemsResponse.flash_sale
                                }
                           }
                        )
                }
                .onDisappear {
                    cancellable?.cancel()
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                                    HStack {
                                        Text("Trade by")
                                            .font(.custom("Montserrat-Bold", size: 20))
                                        Text("bata")
                                            .font(.custom("Montserrat-Bold", size: 20))
                                            .foregroundColor(Color("Btn"))
                                    }
                                }
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            //
                        } label: {
                            Image(systemName: "line.3.horizontal").foregroundColor(.black)
                        }
                    }
                    ToolbarItem{
                        VStack {
                            Image("photo")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 35, height: 35)
                                .clipShape(Circle())
                                .padding(.bottom, -7)
                            Button {
                                //
                            } label: {
                                HStack {
                                    Text("Location")
                                        .font(.custom("Montserrat-Regular", size: 13))
                                        .foregroundColor(.black)
                                    Image(systemName: "chevron.down")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 6, height: 6)
                                        .foregroundColor(.black)
                                }
                            }
                            .padding(.bottom, -8)
                        }
                    }
                }.padding()
            }
        }
    }
}

struct Page1_Previews: PreviewProvider {
    static var previews: some View {
        Page1View()
    }
}
