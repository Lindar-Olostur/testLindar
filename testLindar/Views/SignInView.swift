//
//  ContentView.swift
//  testLindar
//
//  Created by Lindar Olostur on 13.03.2023.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var archive: Archive
    @FocusState private var fieldIsFocused: Bool
    @State private var showLogInView = false
    @State private var showPage1View = false
    @ObservedObject var viewModel: SignInViewModel<BasicEmailValidator>

        init() {
            self.viewModel = SignInViewModel(validator: BasicEmailValidator(), archive: Archive())
        }


    
    var body: some View {
//SIGN IN
        VStack {
            Text("Sign In")
                .font(.custom("Montserrat-SemiBold", size: 30))
                .padding(.bottom, 50)
            TextField("First Name", text: $viewModel.firstName)
                .textFieldStyle(GrayTextField())
                .focused($fieldIsFocused)
            TextField("Last Name", text: $viewModel.lastName)
                .textFieldStyle(GrayTextField())
                .focused($fieldIsFocused)
            EmailTextField(email: $viewModel.email)
            
            Button {
                viewModel.archive.myList.users = archive.myList.users
                if viewModel.signIn() {
                    archive.myList.users.append(User(firstName: viewModel.firstName, lastName: viewModel.lastName, email: viewModel.email))
                    archive.writeToFile()
                    showPage1View = true
                }
            } label: {
                Text("Sign In")
            }
            .buttonStyle(BigBlueButton())
//LOG IN
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
//SIGN IN WITH
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
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Button("Hide") {
                    fieldIsFocused = false
                }
            }
        }
        .onAppear {
           archive.getFile()
           //archive.myList = archive.autoload()
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

struct EmailTextField: View {
    @Binding var email: String
    
    
    var body: some View {
        TextField("Email", text: $email)
            .textFieldStyle(GrayTextField())
            .autocapitalization(.none)
            .keyboardType(.emailAddress)
            .textContentType(.emailAddress)
    }
}
