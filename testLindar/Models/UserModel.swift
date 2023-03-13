//
//  Model.swift
//  testLindar
//
//  Created by Lindar Olostur on 28.07.2022.
//

import Foundation

struct MyList: Codable {
    var users: [User] = []
    
    func signIn(first: String, last: String, email: String) -> Bool {
        var result = false
        for user in users {
            if user.firstName == first && user.lastName == last && user.email == email {
                result = true
            }
        }
        return result
    }

    func logIn(first: String, password: String) -> Bool {
        var result = false
        for user in users {
            if user.firstName == first && user.password == password {
                result = true
            }
        }
        return result
    }
}

struct User: Codable, Hashable, Identifiable {
    var id = UUID()
    var password = ""
    var firstName = ""
    var lastName = ""
    var email = ""
    var photoPath = ""
    
}




