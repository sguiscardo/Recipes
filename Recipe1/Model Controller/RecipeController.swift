//
//  RecipeController.swift
//  Recipe1
//
//  Created by DevMountain on 10/12/21.
//

import Foundation

class RecipeController {
    
    // MARK: - Properties
    static let shared = RecipeController()
    
    var categories: [RecipeCategory] = []
    
    // MARK: - Initializers
    init() {
        loadRecipesFromDisk()
    }
    
    // MARK: - Categories
    func createRecipeCategory(title: String = "Untitled Category", recipes: [Recipe] = []) {
        let category = RecipeCategory(title: title, recipes: recipes)
        categories.append(category)
        saveRecipesToDisk()
    }
    
    func updateRecipeCategory(category: inout RecipeCategory, title: String) {
        category.title = title
        saveRecipesToDisk()
    }
    
    // MARK: - Recipes
    func createRecipe(title: String = "Untitled Recipe",
                   description: String = "",
                   calories: Int = 0,
                   cookTime: TimeInterval = 0,
                   in category: inout RecipeCategory) {
        let recipe = Recipe(title: title, description: description, calories: calories, cookTime: cookTime)
        category.recipes.append(recipe)
        saveRecipesToDisk()
    }
    
    func remove(recipe: Recipe, from category: inout RecipeCategory) {
        guard let index = category.recipes.firstIndex(of: recipe) else { return }
        category.recipes.remove(at: index)
        saveRecipesToDisk()
    }
    
    func update(recipe: inout Recipe,
                title: String,
                description: String,
                calories: Int,
                cookTime: TimeInterval) {
//        guard let indexToUpate = category.recipes.firstIndex(of: recipe) else { return }
        recipe.title = title
        recipe.description = description
        recipe.calories = calories
        recipe.cookTime = cookTime
//        category.recipes[indexToUpate] = recipe
        
    }
    
    
    // MARK: - Persistance
    func saveRecipesToDisk() {
        // 1. Get the address to save the file to
        guard let url = fileURL else { return }
        do {
            // 2. Convert the swift struct or class into raw data
            let data = try JSONEncoder().encode(categories)
            // 3. Save the data to the address from step 1
            try data.write(to: url)
        } catch let error {
            print(error)
        }
    }
    
    func loadRecipesFromDisk() {
        // 1. Get the address your data is saved at
        guard let url = fileURL else { return }
        do {
            // 2. Load the data from the address
            let data = try Data(contentsOf: url)
            // 3. Decode that data into our Swift model object
            let categories = try JSONDecoder().decode([RecipeCategory].self, from: data)
            self.categories = categories
        } catch let error {
            print(error)
        }
    }
    
    private var fileURL: URL? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let url = documentsDirectory.appendingPathComponent("recipes.json")
        return url
    }
}
