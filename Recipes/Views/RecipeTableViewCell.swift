//
//  RecipeTableViewCell.swift
//  Recipes
//
//  Created by Stateful on 10/12/21.
//

import UIKit

protocol RecipeTableViewCellDelegate: AnyObject {
    
    func toggleFavoriteButtonWasTapped(cell: RecipeTableViewCell)
}

class RecipeTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipeSubtitleLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    // MARK: - Properties
    weak var delegate: RecipeTableViewCellDelegate?
    var recipe: Recipe? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Methods
    func updateViews() {
        guard let recipe = recipe else { return }
        recipeTitleLabel.text = recipe.title
        recipeSubtitleLabel.text = "\(recipe.calories ?? 0) Cal"
        let favoriteImageName = recipe.isFavorite ? "star.fill" : "star"
        let favoriteImage = UIImage(systemName: favoriteImageName)
        favoriteButton.setImage(favoriteImage, for: .normal)
    }
    
    // MARK: - IBActions
    @IBAction func toggleFavoriteButtonTapped(_ sender: UIButton) {
        delegate?.toggleFavoriteButtonWasTapped(cell: self)
    }
    
}
