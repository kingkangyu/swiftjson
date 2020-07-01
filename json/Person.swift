//
//  Person.swift
//  json
//
//  Created by kangyu on 2020/7/1.
//  Copyright © 2020 kangyu. All rights reserved.
//

import SwiftUI

struct Person : Codable {

    var name: String
    var gender: String = ""
    var age: Int

    var height: Int
    var weight: Int

    enum CodingKeys: String, CodingKey {

        case name = "title"
        case age
        case body

    }

    enum BodyKeys: String, CodingKey {

        case height
        case weight

    }

}

extension Person {

    init(from decoder: Decoder) throws {

        let vals = try decoder.container(keyedBy: CodingKeys.self)
        name = try vals.decode(String.self, forKey: CodingKeys.name)
        age = try vals.decode(Int.self, forKey: CodingKeys.age)

        let body = try vals.nestedContainer(keyedBy: BodyKeys.self, forKey: .body)
        height = try body.decode(Int.self, forKey: .height)
        weight = try body.decode(Int.self, forKey: .weight)

    }

    func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(age, forKey: .age)

        var body = container.nestedContainer(keyedBy: BodyKeys.self, forKey: .body)
        try body.encode(height, forKey: .height)
        try body.encode(weight, forKey: .weight)

    }

}
