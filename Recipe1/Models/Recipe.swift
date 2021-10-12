//
//  Recipe.swift
//  Recipe1
//
//  Created by DevMountain on 10/12/21.
//

import Foundation

struct Recipe: Codable {
    
    let title: String
    let description: String
    let calories: Int
    let isVegetarian: Bool
    let cookTime: TimeInterval
}
