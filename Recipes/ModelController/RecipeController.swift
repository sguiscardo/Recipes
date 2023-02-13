//
//  RecipeController.swift
//  Recipes
//
//  Created by Sebastian Guiscardo on 2/13/23.
//

import Foundation

class RecipeController {
    
    // MARK: - CRUD
    
    func createRecipe(category: RecipeCategory) {
        let recipe = Recipe(title: "Untitled Recipe", description: "Recipe Description", calories: 0, cookTime: 0)
        category.recipes.append(recipe)
        RecipeCategoryController.sharedInstance.save()
    }
    
    func updateRecipe(recipe: Recipe, newTitle: String, newDesc: String, newCal: Int, newCooktime: Int) {
        recipe.title = newTitle
        recipe.description = newDesc
        recipe.calories = newCal
        recipe.cookTime = newCooktime
        RecipeCategoryController.sharedInstance.save()
    }
    
    func deleteRecipe(recipe: Recipe, from category: RecipeCategory) {
        guard let index = category.recipes.firstIndex(of: recipe) else { return }
        category.recipes.remove(at: index)
        RecipeCategoryController.sharedInstance.save()
        
        
    }
}
