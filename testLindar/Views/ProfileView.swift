//
//  ProfileView.swift
//  testLindar
//
//  Created by Lindar Olostur on 15.03.2023.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @State private var showSignInView = false
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Montserrat-SemiBold", size: 20)!]
    }
    
    var body: some View {
        NavigationView {
            VStack() {
                if let selectedImageData,
                   let uiImage = UIImage(data: selectedImageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                } else {
                    // вообще надо брать дату из базы
                    Image("photo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                }
                PhotosPicker(
                    selection: $selectedItem,
                    matching: .images,
                    photoLibrary: .shared()) {
                        Text("Change photo")
                            .font(.custom("Montserrat-Regular", size: 13))
                            .foregroundColor(.gray)
                    }
                    .onChange(of: selectedItem) { newItem in
                        Task {
                            // Retrive selected asset in the form of Data
                            if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                selectedImageData = data
                            }
                        }
                    }
                Text("Satria Adhi Pradana")
                    .font(.custom("Montserrat-SemiBold", size: 22))
                    .padding(.top)
                Button {
                    //
                } label: {
                    Label {
                        Text("Upload item")
                            .font(.custom("Montserrat-SemiBold", size: 20))
                            .opacity(0.7)
                    } icon: {
                        Image(systemName: "square.and.arrow.up")
                            .padding(.trailing, 40)
                    }
                }.buttonStyle(BigBlueButton())
                
                List() {
                    HStack {
                        ZStack {
                            Circle()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 35, height: 35)
                                .foregroundColor(.gray)
                                .opacity(0.2)
                            Image(systemName: "menubar.rectangle")
                        }
                        Text("Trade store").font(.custom("Montserrat-Regular", size: 14))
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .padding(.top, 3)
                    .listRowSeparator(.hidden)
                    HStack {
                        ZStack {
                            Circle()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 35, height: 35)
                                .foregroundColor(.gray)
                                .opacity(0.2)
                            Image(systemName: "menubar.rectangle")
                        }
                        Text("Payment method").font(.custom("Montserrat-Regular", size: 14))
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .padding(.top, 3)
                    .listRowSeparator(.hidden)
                    HStack {
                        ZStack {
                            Circle()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 35, height: 35)
                                .foregroundColor(.gray)
                                .opacity(0.2)
                            Image(systemName: "menubar.rectangle")
                        }
                        Text("Balance").font(.custom("Montserrat-Regular", size: 14))
                        Spacer()
                        Text("$ 1593")
                    }
                    .padding(.top, 3)
                    .listRowSeparator(.hidden)
                    HStack {
                        ZStack {
                            Circle()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 35, height: 35)
                                .foregroundColor(.gray)
                                .opacity(0.2)
                            Image(systemName: "menubar.rectangle")
                        }
                        Text("Trade history").font(.custom("Montserrat-Regular", size: 14))
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .padding(.top, 3)
                    .listRowSeparator(.hidden)
                    HStack {
                        ZStack {
                            Circle()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 35, height: 35)
                                .foregroundColor(.gray)
                                .opacity(0.2)
                            Image(systemName: "arrow.triangle.2.circlepath")
                        }
                        Text("Restore purchase").font(.custom("Montserrat-Regular", size: 14))
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .padding(.top, 3)
                    .listRowSeparator(.hidden)
                    HStack {
                        ZStack {
                            Circle()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 35, height: 35)
                                .foregroundColor(.gray)
                                .opacity(0.2)
                            Image(systemName: "questionmark.circle")
                        }
                        Text("Help").font(.custom("Montserrat-Regular", size: 14))
                    }
                    .padding(.top, 3)
                    .listRowSeparator(.hidden)
                    HStack {
                        ZStack {
                            Circle()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 35, height: 35)
                                .foregroundColor(.gray)
                                .opacity(0.2)
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                        }
                        Text("Log out").font(.custom("Montserrat-Regular", size: 14))
                    }
                    .padding(.top, 3)
                    .listRowSeparator(.hidden)
                    .onTapGesture {
                        showSignInView = true
                    }
                }
                .listStyle(.plain)
                
                Spacer()

            }
            .padding(.horizontal)
            .navigationBarTitle("Profile", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        //
                    } label: {
                        Image(systemName: "arrow.left")
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $showSignInView) {
            SignInView(validator: BasicEmailValidator())
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
