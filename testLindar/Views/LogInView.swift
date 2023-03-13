//
//  LogInView.swift
//  testLindar
//
//  Created by Lindar Olostur on 14.03.2023.
//

import SwiftUI

struct LogInView: View {
    @EnvironmentObject var archive: Archive
    @State private var showMainTabView = false
    @State var firstName = ""
    @State var password = ""
    @State private var showErrorAlert: Bool = false
    
    var body: some View {
        VStack {
            Text("Welcome back")
                .font(.custom("Montserrat-SemiBold", size: 30))
                .padding(.bottom, 50)
            TextField("First Name", text: $firstName)
                .textFieldStyle(GrayTextField())
            SecureInputView("Password", text: $password)
                .padding(.bottom, 50)
            Button {
                guard archive.myList.logIn(first: firstName, password: password) else {
                    showErrorAlert = true
                    return
                }
                showMainTabView = true
            } label: {
                Text("Login")
            }
            .buttonStyle(BigBlueButton())
        }
        .fullScreenCover(isPresented: $showMainTabView) {
            MainTabView()
        }
        .alert(isPresented: $showErrorAlert) {
            Alert(
                title: Text("Wrong"),
                message: Text("Please check First name and Password")
            )
        }
        .padding()
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView().environmentObject(Archive())
    }
}
