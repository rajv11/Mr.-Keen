//
//  PersonFetcher.swift
//  Mr. Kenn
//
//  Created by student on 11/12/18.
//  Copyright © 2018 raj. All rights reserved.
//

import Foundation

class PersonFetcher {
    static var personFetcher:PersonFetcher = PersonFetcher()
    private var persons:[Person]
    init() {
        persons = []
    }
    subscript(_ index:Int) -> Person {
        return persons[index]
    }
    func numPerson() -> Int {
        return persons.count
    }
    
    func fetchPersons() {
        let urlSession = URLSession.shared
        let url = URL(string: "http://www.json-generator.com/api/json/get/ceEYsNxRki?indent=2")
        urlSession.dataTask(with: url!, completionHandler: displayPersons).resume()
    }
    
    func displayPersons(data:Data?, urlResponse:URLResponse?,  error:Error?) {
        do {
            let decoder:JSONDecoder  =  JSONDecoder()
            persons = try decoder.decode( [Person].self, from: data!)
            DispatchQueue.main.async() {
                    NotificationCenter.default.post(name: .PersonsFetched, object:  nil)
                
            }
                for person in self.persons {
                    print(person)
                }
            }catch {
            print(error)
            
        }
    }
}
extension Notification.Name  {
    static let PersonsFetched = Notification.Name("PersonsFetched")
    
}
