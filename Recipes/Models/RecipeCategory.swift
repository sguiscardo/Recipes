//
//  RecipeCategory.swift
//  Recipes
//
//  Created by Sebastian Guiscardo on 2/13/23.
//

import Foundation

class RecipeCategory: Encodable, Decodable {
    
    let id: UUID
    var title: String
    var recipes: [Recipe]
    
    init(id: UUID = UUID(), title: String, recipes: [Recipe] = []) {
        self.id = id
        self.title = title
        self.recipes = recipes
    }
}// end of class

extension RecipeCategory: Equatable {
    static func == (lhs: RecipeCategory, rhs: RecipeCategory) -> Bool {
        return lhs.id == rhs.id // Scott nailed this day one... I don't have to use multiple variables to change somthing.
    }
}
// if your protocal has equations you have to add it to extension and if it does not you add it to the class decoration site.

