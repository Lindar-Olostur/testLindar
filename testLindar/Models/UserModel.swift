//
//  Model.swift
//  testLindar
//
//  Created by Lindar Olostur on 28.07.2022.
//

import Foundation

struct User: Codable, Hashable, Identifiable {
    var id = UUID()
    var password = ""
    var firstName = ""
    var lastName = ""
    var email = ""
    var photoPath = ""
    
}




