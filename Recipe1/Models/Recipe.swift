//
//  Recipe.swift
//  Recipe1
//
//  Created by DevMountain on 10/12/21.
//

import Foundation

struct Recipe: Codable, Equatable {
    let id: UUID
    var title: String
    var description: String
    var calories: Int
    var cookTime: TimeInterval
    
    init(id: UUID = UUID(), title: String, description: String, calories: Int, cookTime: TimeInterval) {
        self.id = id
        self.title = title
        self.description = description
        self.calories = calories
        self.cookTime = cookTime
    }
}
