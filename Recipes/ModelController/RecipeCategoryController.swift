//
//  RecipeCategoryController.swift
//  Recipes
//
//  Created by Sebastian Guiscardo on 2/13/23.
//

import Foundation

class RecipeCategoryController {
    // MARK: - Properties
    static let sharedInstance = RecipeCategoryController()
    // Source of truth
    var categories: [RecipeCategory] = []
    
    // MARK: - Crud
    
    func createCategory(with name: String) {
        let category = RecipeCategory(title: name)
        categories.append(category)
        save()
    }
    
    func updateCategory(categoryToUpdate: RecipeCategory, newTitle: String) {
        categoryToUpdate.title = newTitle
        save()
    }
    
    func delete(category categoryToDelete: RecipeCategory) {
        guard let index = categories.firstIndex(of: categoryToDelete) else { return }
        categories.remove(at: index)
        save()
    }
    
    func save() {
        
        save()
    }
    
    func load() {
        
    }
}//end of class
