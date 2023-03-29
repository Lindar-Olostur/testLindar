//
//  SignInVM.swift
//  testLindar
//
//  Created by Lindar Olostur on 21.03.2023.
//

import Foundation
import SwiftUI

protocol EmailValidator {
    func isValidEmail(_ email: String) -> Bool
}

class SignInViewModel<Validator: EmailValidator>: ObservableObject {
    var archive: Archive
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var showErrorAlert: Bool = false
    @Published var errorTitle = ""
    @Published var errorMessage = ""
    let validator: Validator
    
    init(firstName: String = "", lastName: String = "", email: String = "", validator: Validator, archive: Archive) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.validator = validator
        self.archive = archive
    }
    
    @MainActor func signIn() -> Bool {

        guard fieldIsEmpty(first: firstName, last: lastName, email: email) == false else {
            errorTitle = "Empty fields"
            errorMessage = "Please fill out all fields"
            showErrorAlert = true
            return false
        }
        
        guard validator.isValidEmail(email) else {
            errorTitle = "Invalid email"
            errorMessage = "Please enter a valid email"
            showErrorAlert = true
            return false
        }
        
        guard archive.myList.checkMatchAccount(first: firstName, last: lastName, email: email) == false else {
            errorTitle = "Match user"
            errorMessage = "Please login"
            showErrorAlert = true
            return false
        }
        
        return true
    }
    
    func fieldIsEmpty(first: String, last: String, email: String) -> Bool {
        return first.isEmpty || last.isEmpty || email.isEmpty
    }

}

struct BasicEmailValidator: EmailValidator {
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}

