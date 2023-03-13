//
//  SignInVM.swift
//  testLindar
//
//  Created by Lindar Olostur on 20.03.2023.
//

import Foundation

protocol SignInViewModelProtocol: ObservableObject {
    var firstName: String { get set }
    var lastName: String { get set }
    var email: String { get set }
    var showErrorAlert: Bool { get set }
    var errorTitle: String { get set }
    var errorMessage: String { get set }
    var showLogInView: Bool { get set }
    var showPage1View: Bool { get set }
    func signIn()
    func showLogInView()
}

class SignInViewModel: SignInViewModelProtocol {
    @EnvironmentObject var archive: Archive

    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var showErrorAlert = false
    @Published var errorTitle = ""
    @Published var errorMessage = ""
    @Published var showLogInView = false
    @Published var showPage1View = false

    private let validator: EmailValidator

    init(validator: EmailValidator) {
        self.validator = validator
    }

    func signIn() {
        guard fieldIsEmpty(firstName: firstName, lastName, email) == false else {
            showErrorAlert = true
            errorTitle = "Error"
            errorMessage = "Please fill in all fields."
            return
            }
