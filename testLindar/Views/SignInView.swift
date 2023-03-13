//
//  ContentView.swift
//  testLindar
//
//  Created by Lindar Olostur on 13.03.2023.
//

import SwiftUI

struct SignInView<Validator: EmailValidator>: View {
    @EnvironmentObject var archive: Archive
    @State private var showLogInView = false
    @State private var showPage1View = false
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    let validator: Validator
    @State private var showErrorAlert: Bool = false
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    
    var body: some View {
        VStack {
            Text("Sign In")
                .font(.custom("Montserrat-SemiBold", size: 30))
                .padding(.bottom, 50)
            TextField("First Name", text: $firstName)
                .textFieldStyle(GrayTextField())
            TextField("Last Name", text: $lastName)
                .textFieldStyle(GrayTextField())
            EmailTextField(email: $email)
            
            Button {
                
                guard fieldIsEmpty(first: firstName, last: lastName, email: email) == false else {
                    errorTitle = "Empty fields"
                    errorMessage = "Please fill out all fields"
                    showErrorAlert = true
                    return
                }
                
                guard validator.isValidEmail(email) else {
                    errorTitle = "Invalid email"
                    errorMessage = "Please enter a valid email"
                    showErrorAlert = true
                    return
                }
                
                guard archive.myList.signIn(first: firstName, last: lastName, email: email) == false else {
                    errorTitle = "Match user"
                    errorMessage = "Please login"
                    showErrorAlert = true
                    return
                }
                
                let newUser = User(firstName: firstName, lastName: lastName, email: email)
                archive.myList.users.append(newUser)
                archive.writeToFile()
                showPage1View = true
            } label: {
                Text("Sign In")
            }
            .buttonStyle(BigBlueButton())
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
        .onAppear {
            archive.getFile()
           // archive.myList = archive.autoload()
            print(archive.myList)
        }
        .sheet(isPresented: $showLogInView) {
            LogInView()
        }
        .fullScreenCover(isPresented: $showPage1View) {
            MainTabView()
        }
        .padding()
        .alert(errorTitle, isPresented: $showErrorAlert) {
            
        } message: {
            Text(errorMessage)
        }
    }

    func fieldIsEmpty(first: String, last: String, email: String) -> Bool {
        var result = true

        if first == "" || last == "" || email == "" {
            result = true
            return result
        } else {
            result = false
            return result
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(validator: BasicEmailValidator()).environmentObject(Archive())
    }
}
