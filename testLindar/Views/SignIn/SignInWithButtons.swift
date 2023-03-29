//
//  SignInWithButtons.swift
//  testLindar
//
//  Created by Lindar Olostur on 28.03.2023.
//

import SwiftUI

struct SignInWithButtons: View {
    var body: some View {
        VStack(alignment: .listRowSeparatorLeading) {
            Button {
                //
            } label: {
                HStack {
                    Image("google")
                        .resizable()
                        .frame(width: 42.0, height: 42.0)
                    Text("Sign in with Google")
                        .font(.custom("Montserrat-SemiBold", size: 14))
                        .foregroundColor(.black)
                }
            }.padding()
            
            Button {
                //
            } label: {
                HStack {
                    Image("apple")
                        .resizable()
                        .frame(width: 42.0, height: 42.0)
                    Text("Sign in with Apple")
                        .font(.custom("Montserrat-SemiBold", size: 14))
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct SignInWithButtons_Previews: PreviewProvider {
    static var previews: some View {
        SignInWithButtons()
    }
}
