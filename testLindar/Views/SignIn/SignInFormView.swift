//
//  NameTextFieldView.swift
//  testLindar
//
//  Created by Lindar Olostur on 28.03.2023.
//

import SwiftUI

struct SignInFormView: View {
    @ObservedObject var viewModel: SignInViewModel<BasicEmailValidator>
    @FocusState private var fieldIsFocused: Bool
    @EnvironmentObject var archive: Archive
    @Binding var showPage1View: Bool
    
    var body: some View {
        VStack {
            TextField("First Name", text: $viewModel.firstName)
                .textFieldStyle(GrayTextField())
                .focused($fieldIsFocused, equals: true)
            TextField("Last Name", text: $viewModel.lastName)
                .textFieldStyle(GrayTextField())
                .focused($fieldIsFocused, equals: true)
            TextField("Email", text: $viewModel.email)
                .textFieldStyle(GrayTextField())
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
                .textContentType(.emailAddress)
            
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
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Button("Hide") {
                    fieldIsFocused = false
                }
            }
        }
    }
}


struct SignInFormView_Previews: PreviewProvider {
    static var previews: some View {
        SignInFormView(viewModel: SignInViewModel<BasicEmailValidator>(validator: BasicEmailValidator(), archive: Archive()), showPage1View: .constant(false))
    }
}
