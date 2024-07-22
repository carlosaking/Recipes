//
//  DetailViewModel.swift
//  Recipes
//
//  Created by Carlos on 7/20/24.
//

import Foundation


final class DetailViewModel: ObservableObject {
    @Published var recipeDetail: RecipeDetail?
    @Published var isLoading = true
    @Published var hasError = false
    
    func getRecipeFor(_ meal: Meal) async throws {
        let endpoint = "\(BASE_URL)lookup.php?i=\(meal.id ?? "")"
        guard let url = URL(string: endpoint) else { throw RAppError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw RAppError.invalidResponse }
        
        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(RecipeDetailResponse.self, from: data)
            
            DispatchQueue.main.async {
                self.isLoading = false
                var ingredients: [Ingredient] = []
                
                decodedResponse.meals.forEach { meal in
                    guard let id = meal["idMeal"], let name = meal["strMeal"], let imageUrl = meal["strMealThumb"], let instructions = meal["strInstructions"], id != nil, name != nil, imageUrl != nil, instructions != nil, !id!.isEmpty, !name!.isEmpty, !imageUrl!.isEmpty, !instructions!.isEmpty else { return }
                    
                    let localMeal = Meal(id: id, name: name, imageUrl: imageUrl)
                    
                    for i in 1...20 {
                        let ingredientKey = "strIngredient\(i)"
                        let measureKey = "strMeasure\(i)"
                        
                        if let ingredient = meal[ingredientKey], let measure = meal[measureKey], ingredient != nil, !ingredient!.isEmpty {
                            ingredients.append(Ingredient(name: ingredient ?? "", measure: measure ?? ""))
                        }
                    }
                    // To remove duplicate ingredients
                    // Battenberg Cake - id 52894 has duplicate ingredients
                    let uniqueIngredients = Array(Set(ingredients))
                    
                    self.recipeDetail = RecipeDetail(meal: localMeal, instructions: instructions ?? "", ingredients: uniqueIngredients)
                }
            }
        } catch {
            throw RAppError.invalidData
        }
    }
}
