//
//  Meal.swift
//  Recipes
//
//  Created by Carlos on 7/19/24.
//

import Foundation

struct Meal: Codable, Identifiable, Hashable {
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case imageUrl = "strMealThumb"
    }
    
    let id: String?
    let name: String?
    let imageUrl: String?
}

struct Ingredient: Decodable, Hashable {
    let name: String
    let measure: String
}

struct RecipeDetail {
    let meal: Meal
    let instructions: String
    let ingredients: [Ingredient]
}

struct Meals: Decodable {
    let meals: [Meal]
}

struct RecipeDetailResponse: Decodable {
    let meals: [[String: String?]]
}
