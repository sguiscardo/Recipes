//
//  RecipeCategory.swift
//  Recipe1
//
//  Created by Stateful on 10/12/21.
//

import Foundation

class RecipeCategory: Codable {
    let id: UUID
    var title: String
    var recipes: [Recipe]
    
    init(id: UUID = UUID(), title: String, recipes: [Recipe] = []) {
        self.id = id
        self.title = title
        self.recipes = recipes
    }
}

extension RecipeCategory: Equatable {
    static func == (lhs: RecipeCategory, rhs: RecipeCategory) -> Bool {
        return lhs.id == rhs.id
    }
}
