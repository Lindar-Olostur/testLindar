//
//  UserVM.swift
//  testLindar
//
//  Created by Lindar Olostur on 21.03.2023.
//

import Foundation

class MyList: Codable {
    var users: [User] = []
    
    func checkMatchAccount(first: String, last: String, email: String) -> Bool {
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
