//
//  RecipeTableViewController.swift
//  Recipe1
//
//  Created by DevMountain on 10/12/21.
//

import UIKit

class RecipeTableViewController: UITableViewController {
    
    @IBOutlet weak var categoryNameTextField: UITextField!
    @IBOutlet weak var filterSegmentedControl: UISegmentedControl!
    
    let recipeController = RecipeController.shared
    var category: RecipeCategory?
    
    private var filteredRecipes: [Recipe] {
        if filterSegmentedControl.selectedSegmentIndex == 1 {
            return category?.recipes.filter { $0.isFavorite } ?? []
        } else {
            return category?.recipes ?? []
        }
    }

    // MARK: - Lifecycle Methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        categoryNameTextField.text = category?.title
        tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard let category = category,
            let newTitle = categoryNameTextField.text else { return }
        recipeController.updateRecipeCategory(category: category, title: newTitle)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredRecipes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as? RecipeTableViewCell else { return UITableViewCell() }
        let recipe = filteredRecipes[indexPath.row]
        cell.recipe = recipe
        cell.delegate = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let category = category else { return }
            recipeController.deleteRecipeIn(category: category, index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "toRecipeDetail",
              let recipeDetailViewController = segue.destination as? RecipeDetailViewController,
              let selectedRow = tableView.indexPathForSelectedRow?.row else { return }
        let recipe = filteredRecipes[selectedRow]
        recipeDetailViewController.recipe = recipe
    }
    
    // MARK: - Actions
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        guard let category = category else { return }
        let oldRecipeCount = filteredRecipes.count
        recipeController.createRecipe(in: category)
        let newRecipeCount = filteredRecipes.count
        
        guard newRecipeCount > oldRecipeCount else { return }
        let newRow = filteredRecipes.count - 1
        let indexPath = IndexPath(row: newRow, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    @IBAction func filterSegmentedControlValueChanged(_ sender: UISegmentedControl) {
        tableView.reloadData()
    }
}

// MARK: RecipeTableViewCellDelegate Conformance
extension RecipeTableViewController: RecipeTableViewCellDelegate {
    
    func toggleFavoriteButtonWasTapped(cell: RecipeTableViewCell) {
        guard let recipe = cell.recipe else { return }
        recipeController.toggleFavorite(recipe: recipe)
        tableView.reloadData()
    }
}
