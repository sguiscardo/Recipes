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
    
    init() {
        loadRecipesFromDisk()
    }
    
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
    
    func deleteCategory(category categoryToDelete: RecipeCategory) {
        guard let index = categories.firstIndex(of: categoryToDelete) else { return }
        categories.remove(at: index)
        save()
    }
    
    // Computed Property (recieves it's value from whatever happens inside the body of the function.
    private var fileURL: URL? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let finalURL = documentsDirectory.appendingPathComponent("recipes.json")
        //let finalURL = documentsDirectory.appending(path: "recipes.json") //new way of doing it.
        return finalURL
    }// end of url
    
    func save() {
        //1. get address to save the file
        guard let saveLocation = fileURL else { return }
        //2. Convert the swift struct of class into JSON Data
        do {
            let jsonData = try JSONEncoder().encode(categories)
            // 3. Save (write) the data to the address from step 1.
            try jsonData.write(to: saveLocation)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func loadRecipesFromDisk() {
        // 1. Get the address the data is saved at
        guard let url = fileURL else { return }
        do {
            // 2. Load the json data from the address
        let retrievedJSONData = try Data(contentsOf: url)
            // 3. Convert from JSON to out swift Model Object Type
            let decodedCategories = try JSONDecoder().decode([RecipeCategory].self, from: retrievedJSONData)
            self.categories = decodedCategories
        } catch let error {
            print(error.localizedDescription)
        }
    }
}//end of class
