//
//  Page1.swift
//  testLindar
//
//  Created by Lindar Olostur on 14.03.2023.
//

import SwiftUI
import Combine


struct Page1View: View {
    @State var items: [Latest] = []
    @State var flash: [Flash] = []
    @StateObject var viewModel = SearchViewModel()
    @State var cancellable: AnyCancellable?
    @State private var searchText = ""
    private let icons: [(String, String)] = [("iphone", "Phones"), ("headphones", "Headphones"), ("gamecontroller", "Games"), ("car", "Cars"), ("sofa", "Furniture"), ("figure.and.child.holdinghands", "Kids")]
    
    var body: some View {
        
        NavigationView {
            VStack {
                VStack {
                    TextField("What are you looking for?", text: $viewModel.searchText)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(Color("llgray").opacity(0.7))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .padding(.top, 20)

                    if viewModel.searchResults.count > 0 {
                        List(viewModel.searchResults, id: \.self) { result in
                            Text(result)
                        }
                        .listStyle(.plain)
                        .padding(.horizontal)
                        .padding(.top, 10)
                    }
                }
                .onChange(of: viewModel.searchText) { text in
                    viewModel.search()
                }
                ScrollView(showsIndicators: false) {
                    
                    //Категории
                    HStack {
                        ForEach(0..<icons.count) { i in
                            Button {
                                //
                            } label: {
                                VStack {
                                    ZStack {
                                        Circle()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 40, height: 40)
                                            .foregroundColor(.gray)
                                            .opacity(0.2)
                                        Image(systemName: icons[i].0)
                                    }
                                    Text(icons[i].1)
                                        .font(.custom("Montserrat-Regular", size: 8))
                                        .opacity(0.5)
                                }.padding(.horizontal, 5)
                            }
                            .foregroundColor(.black)
                        }
                    }
                    //LATEST ITEMS
                    VStack {
                        HStack {
                            Text("Latest")
                                .font(.custom("Montserrat-Bold", size: 20))
                            Spacer()
                            Button {
                                //
                            } label: {
                                Text("View all")
                                    .font(.custom("Montserrat-Bold", size: 12))
                                    .foregroundColor(.gray)
                                    .opacity(0.5)
                            }
                            
                        }.padding(.top)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(items, id: \.name) { item in
                                    ZStack {
                                        AsyncImage(url: item.imageUrl) { image in
                                            image
                                                .resizable()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .scaledToFill()
                                        .frame(width: 120, height: 150)
                                        .clipped()
                                        .cornerRadius(10.0)
                                        HStack {
                                            VStack(alignment: .leading) {
                                                Spacer()
                                                Text(item.category)
                                                    .font(.custom("Montserrat-Bold", size: 8))
                                                    .padding(5)
                                                    .background(Color("llgray").opacity(0.7))
                                                    .clipShape(Capsule())
                                                Text(item.name)
                                                    .font(.custom("Montserrat-Bold", size: 10))
                                                    .foregroundColor(.white)
                                                HStack {
                                                    Text("$ \(item.price)")
                                                        .font(.custom("Montserrat-Bold", size: 10))
                                                        .foregroundColor(.white)
                                                        .opacity(0.8)
                                                        .padding(.top, 4)
                                                    Spacer()
                                                    Button {
                                                        //
                                                    } label: {
                                                        Image(systemName: "plus")
                                                            .padding(5)
                                                            .background(Color("llgray"))
                                                            .foregroundColor(.black)
                                                            .clipShape(Circle())
                                                    }
                                                }.padding(.bottom, 6)
                                            }
                                            .padding(.horizontal, 6)
                                            
                                        }
                                    }
                                    .frame(width: 120, height: 150)
                                }
                            }
                            //.padding(.horizontal)
                        }
                        
                    }
                    //FLASH SALE
                    VStack {
                        HStack {
                            Text("Flash Sale")
                                .font(.custom("Montserrat-Bold", size: 20))
                            Spacer()
                            Button {
                                //
                            } label: {
                                Text("View all")
                                    .font(.custom("Montserrat-Bold", size: 12))
                                    .foregroundColor(.gray)
                                    .opacity(0.5)
                            }
                            
                        }.padding(.top)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(flash, id: \.name) { item in
                                    NavigationLink {
                                        Page2View()
                                    } label: {
                                        ZStack {
                                            AsyncImage(url: item.imageUrl) { image in
                                                image
                                                    .resizable()
                                            } placeholder: {
                                                ProgressView()
                                            }
                                            .scaledToFill()
                                            .frame(width: 160, height: 200)
                                            .clipped()
                                            .cornerRadius(10.0)
                                            HStack {
                                                VStack(alignment: .leading) {
                                                    HStack {
                                                        Spacer()
                                                        Text("\(item.discount)% off")
                                                            .foregroundColor(.white)
                                                            .font(.custom("Montserrat-Bold", size: 10))
                                                            .padding(5)
                                                            .background(Color(.orange).opacity(0.7))
                                                            .clipShape(Capsule())
                                                    }.padding(.top, 5)
                                                    Spacer()
                                                    Text(item.category)
                                                        .font(.custom("Montserrat-Bold", size: 8))
                                                        .padding(5)
                                                        .foregroundColor(.black)
                                                        .background(Color("llgray").opacity(0.7))
                                                        .clipShape(Capsule())
                                                    Text(item.name)
                                                        .font(.custom("Montserrat-Bold", size: 10))
                                                        .foregroundColor(.white)
                                                    HStack {
                                                        Text("$ \(item.price)")
                                                            .font(.custom("Montserrat-Bold", size: 10))
                                                            .foregroundColor(.white)
                                                            .opacity(0.8)
                                                            .padding(.top, 4)
                                                        Spacer()
                                                        Button {
                                                            //
                                                        } label: {
                                                            Image(systemName: "heart")
                                                                .font(.system(size: 10))
                                                                .padding(5)
                                                                .background(Color("llgray"))
                                                                .foregroundColor(.black)
                                                                .clipShape(Circle())
                                                        }
                                                        Button {
                                                            //
                                                        } label: {
                                                            Image(systemName: "plus")
                                                                .font(.system(size: 20))
                                                                .padding(5)
                                                                .background(Color("llgray"))
                                                                .foregroundColor(.black)
                                                                .clipShape(Circle())
                                                        }
                                                    }.padding(.bottom, 6)
                                                }
                                                .padding(.horizontal, 6)

                                            }
                                        }
                                        .frame(width: 160, height: 200)
                                    }

                                }
                            }
                            //.padding(.horizontal)
                        }
                    }
                    //BRANDS
                    VStack {
                        HStack {
                            Text("Brands")
                                .font(.custom("Montserrat-Bold", size: 20))
                            Spacer()
                            Button {
                                //
                            } label: {
                                Text("View all")
                                    .font(.custom("Montserrat-Bold", size: 12))
                                    .foregroundColor(.gray)
                                    .opacity(0.5)
                            }
                            
                        }.padding(.top)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                    ForEach(0..<3) { _ in
                                        Rectangle()
                                            .foregroundColor(.black)
                                            .frame(width: 110, height: 80)
                                            .cornerRadius(10.0)
                                    }
                                }
                        }
                    }
                    Spacer()
                }
                .navigationBarTitle("", displayMode: .inline)
                .onAppear {
                    cancellable = Publishers.Zip(fetchLatestItems(), fetchFlashSaleItems())
                        .sink(
                            receiveCompletion: { completion in
                                switch completion {
                                case .failure(let error):
                                    print("Error: \(error.localizedDescription)")
                                case .finished:
                                    print("Finished fetching data")
                                }
                            }, receiveValue: { latestItemsResponse, flashSaleItemsResponse in
                                self.items = latestItemsResponse.latest
                                self.flash = flashSaleItemsResponse.flash_sale
                            }
                        )
                }
                .onDisappear {
                    cancellable?.cancel()
                }
                //.searchable(text: $searchText, prompt: "What are you looking for?").padding()
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
                            .padding(.bottom)
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
