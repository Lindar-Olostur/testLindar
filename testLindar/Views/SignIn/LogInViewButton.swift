//
//  LogInViewButton.swift
//  testLindar
//
//  Created by Lindar Olostur on 28.03.2023.
//

import SwiftUI

struct LogInViewButton: View {
    @Binding var showLogInView: Bool
    
    var body: some View {
        HStack {
            Text("Already have an account?")
                .font(.custom("Montserrat-SemiBold", size: 13))
                .opacity(0.5)
            Button {
                showLogInView = true
            } label: {
                Text("Log in")
                    .font(.custom("Montserrat-SemiBold", size: 13))
                    .opacity(0.7)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.bottom, 40)
    }
}


struct LogInViewButton_Previews: PreviewProvider {
    static var previews: some View {
        LogInViewButton(showLogInView: .constant(false))
    }
}
