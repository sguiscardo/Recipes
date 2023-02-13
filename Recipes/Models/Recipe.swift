//
//  Recipe.swift
//  Recipes
//
//  Created by Sebastian Guiscardo on 2/13/23.
//

import Foundation

class Recipe {
    
   //let id: UUID = UUID() //never allow me to change
    let id: UUID //convinient way to identify what I'm looking for.
    var title: String
    var description: String
    var calories: Int?
    var cookTime: Int?
    
    init(id: UUID = UUID(), title: String, description: String, calories: Int? = nil, cookTime: Int? = nil) {
        self.id = id
        self.title = title
        self.description = description
        self.calories = calories
        self.cookTime = cookTime
    }
}//end of class
//UUID universal unique value to determine types and their values. 
