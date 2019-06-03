//
//  JsonModel.swift
//  CantinaProblem
//
//  Created by Jian Ma on 6/1/19.
//  Copyright © 2019 Jian Ma. All rights reserved.
//

import Foundation
struct SubviewContainer: Codable{
    let identifier: String
    let subviews: [Subview]
}
struct Subview: Codable {
    let classNames: [String]
    let subviews: [Subview]
    let `class`: String
    let identifier: String?
    let contentView: ContentView?
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        subviews = try values.decodeIfPresent([Subview].self, forKey: .subviews) ?? []
        `class` = try values.decode(String.self, forKey: .class)
        classNames = try values.decodeIfPresent([String].self, forKey: .classNames) ?? []
        identifier = try values.decodeIfPresent(String.self, forKey: .identifier)
        contentView = try values.decodeIfPresent(ContentView.self, forKey: .contentView)
    }
}
struct ContentView: Codable {
    let subviews: [Subview]?
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        subviews = try values.decodeIfPresent([Subview].self, forKey: .subviews)
    }
}


