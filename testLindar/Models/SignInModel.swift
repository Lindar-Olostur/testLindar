//
//  EmailModel.swift
//  testLindar
//
//  Created by Lindar Olostur on 14.03.2023.
//

import SwiftUI

//struct SignInModel {
//    var firstName = ""
//    var lastName = ""
//    var email = ""
//}
//
//class SignInViewModel: ObservableObject {
//    @Published var model = SignInModel()
//    
//    func register() {
//        // Проверка данных модели и отправка на сервер
//    }
//}

// Форма
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

// Валидатор ввода почты
protocol EmailValidator {
    func isValidEmail(_ email: String) -> Bool
}
struct BasicEmailValidator: EmailValidator {
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}





