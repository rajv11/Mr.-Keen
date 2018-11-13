//
//  Person.swift
//  Mr. Kenn
//
//  Created by student on 11/12/18.
//  Copyright © 2018 raj. All rights reserved.
//

import Foundation
struct Name: Codable {
    var first:String
    var last:String
}
struct Person: Codable {
    var age:Int
    var eyeColor:String
    var name: Name
}
