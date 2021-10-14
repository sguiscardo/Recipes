//
//  Recipe.swift
//  Recipe1
//
//  Created by DevMountain on 10/12/21.
//

import Foundation

class Recipe: Codable {
    let id: UUID
    var title: String
    var description: String
    var calories: Int?
    var cookTime: Int?
    
    init(id: UUID = UUID(), title: String, description: String, calories: Int?, cookTime: Int?) {
        self.id = id
        self.title = title
        self.description = description
        self.calories = calories
        self.cookTime = cookTime
    }
}

extension Recipe: Equatable {
    static func == (lhs: Recipe, rhs: Recipe) -> Bool {
        return lhs.id == rhs.id
    }
}
