//
//  UserClass.swift
//  testLindar
//
//  Created by Lindar Olostur on 28.07.2022.
//

import Foundation
import SwiftUI

@MainActor class Archive: ObservableObject {
    @Published var myList = MyList()

    func writeToFile() {
        let documentDirectoryPath:String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let fileUrl = URL(fileURLWithPath: documentDirectoryPath).appendingPathComponent("Users.json")
            do{
                let encoder = JSONEncoder()
                encoder.outputFormatting = .prettyPrinted
                let JsonData = try encoder.encode(myList)
                try JsonData.write(to: fileUrl)
            } catch {
                //
        }
    }
    
    func getFile() {
        myList = readArchive()
    }
    
    func autoload<T: Decodable>() -> T {
        let data: Data
        let documentDirectoryPath:String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let fileUrl = URL(fileURLWithPath: documentDirectoryPath)
        let file = fileUrl.absoluteURL.appendingPathComponent("Users.json")
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load Users.json from main bundle:\n\(error)")
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse Users.json as \(T.self):\n\(error)")
        }
    }
    
    func readArchive<T: Decodable>() -> T {
        let data: Data

        guard let file = Bundle.main.url(forResource: "Users", withExtension: "json")
        else {
            fatalError("Couldn't find Users.json in main bundle.")
        }

        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load Users.json from main bundle:\n\(error)")
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse Users.json as \(T.self):\n\(error)")
        }
    }
}

