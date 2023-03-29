//
//  ProfileView.swift
//  testLindar
//
//  Created by Lindar Olostur on 15.03.2023.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @State var showSignInView = false
    @State var selectedItem: PhotosPickerItem? = nil
    @State var selectedImageData: Data? = nil
    
    var body: some View {
        NavigationView {
            VStack() {
                ImagePickerView(selectedItem: $selectedItem, selectedImageData: $selectedImageData)
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
                ListView(showSignInView: $showSignInView)
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
            SignInView()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
