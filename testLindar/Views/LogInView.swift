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
    @FocusState private var fieldIsFocused: Bool
    
    var body: some View {
        VStack {
            Text("Welcome back")
                .font(.custom("Montserrat-SemiBold", size: 30))
                .padding(.bottom, 50)
            TextField("First Name", text: $firstName)
                .textFieldStyle(GrayTextField())
                .focused($fieldIsFocused)
            SecureInputView("Password", text: $password)
                .padding(.bottom, 50)
                .focused($fieldIsFocused)
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
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Button("Hide") {
                    fieldIsFocused = false
                }
            }
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

struct SecureInputView: View {  
    @Binding private var text: String
    @State private var isSecured: Bool = true
    private var title: String
    
    init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
        ZStack(alignment: .trailing) {
            Group {
                if isSecured {
                    SecureField(title, text: $text)
                } else {
                    TextField(title, text: $text)
                }
            }.padding(.trailing, 32)

            Button(action: {
                isSecured.toggle()
            }) {
                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                    .accentColor(.gray)
            }
        }
        .padding(7)
        .background(Color(.lightGray).opacity(0.25))
        .cornerRadius(20)
        .multilineTextAlignment(TextAlignment.center)
        .padding(.horizontal)
        .padding(.vertical)
    }
}
