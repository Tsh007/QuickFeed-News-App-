//
//  DataStore.swift
//  QuickFeed
//
//  Created by Tejash Singh on 26/04/24.
//

import Foundation

protocol DataStore: Actor{
    
    associatedtype D
    
    func save(_ current : D)
    func load() -> D?
}

actor PlistDataStore<T: Codable>: DataStore where T: Equatable{
    
    var saved: T?
    let filename: String
    
    init(filename: String){
        self.filename = filename
    }
    
    //file url in local storage
    private var dataURL: URL{
        FileManager.default
            .urls(for: .documentDirectory,in: .userDomainMask)[0]
            .appendingPathComponent("\(filename).plist")
    }
    
    func save(_ current: T){
        if let saved = self.saved, saved == current{
            return
        }
        
        do{
            let encoder = PropertyListEncoder()
            encoder.outputFormat = .binary
            let data = try encoder.encode(current)
            try data.write(to: dataURL,options: [.atomic])
            
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func load() -> T? {
        do{
            let data = try Data(contentsOf: dataURL)
            let decoder = PropertyListDecoder()
            let current = try decoder.decode(T.self,from:data)
            self.saved = current
            return current
        }catch{
            print(error.localizedDescription)
            return nil
        }
    }
}
