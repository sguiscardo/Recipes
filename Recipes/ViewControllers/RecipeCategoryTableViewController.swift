//
//  RecipeCategoryTableViewController.swift
//  Recipe1
//
//  Created by Stateful on 10/12/21.
//

import UIKit

class RecipeCategoryTableViewController: UITableViewController {
    
    let recipeController = RecipeController.shared
    
    // MARK: - Lifecycle Methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeController.categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCategory", for: indexPath)
        let category = recipeController.categories[indexPath.row]
        cell.textLabel?.text = category.title
        cell.detailTextLabel?.text = "\(category.recipes.count) Recipes"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let category = recipeController.categories[indexPath.row]
            recipeController.delete(category: category)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "toRecipeCategoryDetail",
              let categoryDetailViewController = segue.destination as? RecipeTableViewController,
              let selectedRow = tableView.indexPathForSelectedRow?.row else { return }
        let category = recipeController.categories[selectedRow]
        categoryDetailViewController.category = category
    }
    
    // MARK: - IBActions
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        recipeController.createRecipeCategory()
        let newRow = recipeController.categories.count - 1
        let indexPath = IndexPath(row: newRow, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
}
