//
//  Category.swift
//  Symbolicator
//
//  Created by Russell Gordon on 2022-06-26.
//

import Foundation

// Must be hashable to allow navigation to happen
struct Category: Decodable, Identifiable, Hashable {
    var id: String { name }
    var name: String
    var icon: String
    var isSpecial: Bool
    
    static let example = Category(name: "Health", icon: "heart", isSpecial: false)
}
