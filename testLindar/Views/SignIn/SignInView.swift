//
//  ContentView.swift
//  testLindar
//
//  Created by Lindar Olostur on 13.03.2023.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var archive: Archive
    @State private var showLogInView = false
    @State private var showPage1View = false
    @ObservedObject var viewModel: SignInViewModel<BasicEmailValidator>

        init() {
            self.viewModel = SignInViewModel(validator: BasicEmailValidator(), archive: Archive())
        }

    var body: some View {
        VStack {
            Text("Sign In")
                .font(.custom("Montserrat-SemiBold", size: 30))
                .padding(.bottom, 50)
            SignInFormView(viewModel: viewModel, archive: _archive, showPage1View: $showPage1View)
            LogInViewButton(showLogInView: $showLogInView)
            SignInWithButtons()
        }
        .onAppear {
           archive.getFile()
        }
        .sheet(isPresented: $showLogInView) {
            LogInView()
        }
        .fullScreenCover(isPresented: $showPage1View) {
            MainTabView()
        }
        .padding()
        .alert(viewModel.errorTitle, isPresented: $viewModel.showErrorAlert) {
            
        } message: {
            Text(viewModel.errorMessage)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()//(validator: BasicEmailValidator())
            .environmentObject(Archive())
            .environmentObject(Page1ViewModel())
    }
}
