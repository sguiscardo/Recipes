//
//  RecipeCategory.swift
//  Recipe1
//
//  Created by DevMountain on 10/12/21.
//

import Foundation

struct RecipeCategory: Codable, Equatable {
    let id: UUID
    var title: String
    var recipes: [Recipe]
    
    init(id: UUID = UUID(), title: String, recipes: [Recipe] = []) {
        self.id = id
        self.title = title
        self.recipes = recipes
    }
}
